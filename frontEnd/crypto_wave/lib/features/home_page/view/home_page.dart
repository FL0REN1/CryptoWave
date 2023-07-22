import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_wave/features/helper_page/helper_page.dart';
import 'package:crypto_wave/features/home_page/bloc/bloc.dart';
import 'package:crypto_wave/features/home_page/widgets/widgets.dart';
import 'package:crypto_wave/repositories/coins_repository/coins_repository.dart';
import 'package:crypto_wave/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeBloc = HomeBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _homeBloc.add(const LoadHome(completer: null));

    //_homeBloc.startUpdatingCoins();

    super.initState();
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _homeBloc.add(LoadHome(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            bloc: _homeBloc,
            builder: (context, state) {
              if (state is HomeLoaded) {
                final theme = Theme.of(context);
                return Column(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: RoutedIconButton(
                                        svgIconPath:
                                            'assets/svg/booksquare.svg',
                                        flutterIcon: null,
                                        padding: 4,
                                        func: () {},
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: RoutedIconButton(
                                      svgIconPath: 'assets/svg/search.svg',
                                      flutterIcon: null,
                                      padding: 8,
                                      func: () {},
                                    ),
                                  ),
                                  RoutedIconButton(
                                    svgIconPath: 'assets/svg/notification.svg',
                                    flutterIcon: null,
                                    padding: 8,
                                    func: () {
                                      AutoRouter.of(context).push(
                                        const NotificationsRoute(),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: Text(
                                'Favorites',
                                style: theme.textTheme.labelMedium,
                              ),
                            ),
                            const SizedBox(height: 20),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(state.coins.length,
                                    (int index) {
                                  final coin = state.coins[index];
                                  bool isLastElement =
                                      index == state.coins.length - 1;
                                  return Container(
                                    margin: isLastElement
                                        ? EdgeInsets.zero
                                        : const EdgeInsets.only(right: 20),
                                    child: CoinHugeContainer(
                                      coin: coin,
                                    ),
                                  );
                                }),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: Text(
                                'Market',
                                style: theme.textTheme.labelMedium,
                              ),
                            ),
                            const SizedBox(height: 10),
                            ListView.separated(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(top: 20),
                              separatorBuilder: (context, state) =>
                                  const Divider(thickness: 2),
                              itemCount: state.coins.length,
                              itemBuilder: (context, i) {
                                final coin = state.coins[i];
                                return CoinSmallContainer(coin: coin);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Expanded(
                      child: NavigationBottom(
                        selectedIndex: 0,
                      ),
                    ),
                  ],
                );
              }

              if (state is HomeLoadingFailure) {
                return LoadingFailure(
                  restart: () => _homeBloc.add(
                    const LoadHome(completer: null),
                  ),
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
