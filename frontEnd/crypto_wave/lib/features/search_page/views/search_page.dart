import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_wave/features/authorization_page/widgets/widgets.dart';
import 'package:crypto_wave/features/helper_page/helper_page.dart';
import 'package:crypto_wave/features/home_page/widgets/widgets.dart';
import 'package:crypto_wave/features/search_page/bloc/bloc.dart';
import 'package:crypto_wave/repositories/coins_repository/coins_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchBloc = SearchBloc(GetIt.I<AbstractCoinsRepository>());
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    _searchBloc.add(const LoadSearch(completer: null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        final completer = Completer();
        _searchBloc.add(LoadSearch(completer: completer));
        return completer.future;
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          leading: IconButton(
            splashRadius: 20,
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 20, top: 15),
                child: TextInput(
                  labelText: 'Search',
                  security: false,
                  giveMeText: searchController,
                  onTextSubmitted: (newText) {
                    setState(() {
                      searchController.text = newText;
                    });
                  },
                  errorCondition: (value) => Validators.isValidSearch(value),
                  errorText: Validators.searchErrorText,
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<SearchBloc, SearchState>(
          bloc: _searchBloc,
          builder: (context, state) {
            if (state is SearchLoaded) {
              final filteredCoins = state.search
                  .where((coin) => coin.name
                      .toLowerCase()
                      .contains(searchController.text.toLowerCase()))
                  .toList();
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      separatorBuilder: (context, state) =>
                          const Divider(thickness: 2),
                      itemCount: filteredCoins.length,
                      itemBuilder: (context, i) {
                        final coin = filteredCoins[i];
                        return CoinSmallContainer(coin: coin);
                      },
                    ),
                  ],
                ),
              );
            }

            if (state is SearchLoadingFailure) {
              return LoadingFailure(
                restart: () => _searchBloc.add(
                  const LoadSearch(completer: null),
                ),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
