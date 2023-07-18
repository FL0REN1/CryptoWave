import 'package:auto_route/auto_route.dart';
import 'package:crypto_wave/features/helper_page/helper_page.dart';
import 'package:crypto_wave/features/home_page/bloc/bloc.dart';
import 'package:crypto_wave/features/home_page/widgets/widgets.dart';
import 'package:crypto_wave/repositories/coins_repository/coins_repository.dart';
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
    _homeBloc.add(const LoadHome());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: _homeBloc, // по какому блоку билдим
          builder: (context, state) {
            if (state is HomeLoaded) {
              final theme = Theme.of(context);

              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: const Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: IconContainer(
                                svgIconPath: 'assets/svg/booksquare.svg',
                                flutterIcon: null,
                                padding: 4,
                                blueStyle: true,
                                greenStyle: false,
                                redStyle: false,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: IconContainer(
                              svgIconPath: 'assets/svg/search.svg',
                              flutterIcon: null,
                              padding: 8,
                              blueStyle: true,
                              greenStyle: false,
                              redStyle: false,
                            ),
                          ),
                          IconContainer(
                            svgIconPath: 'assets/svg/notification.svg',
                            flutterIcon: null,
                            padding: 8,
                            blueStyle: true,
                            greenStyle: false,
                            redStyle: false,
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                            List.generate(state.coins.length, (int index) {
                          final coin = state.coins[index];
                          bool isLastElement = index == state.coins.length - 1;

                          return Container(
                            margin: isLastElement
                                ? EdgeInsets.zero
                                : const EdgeInsets.only(right: 20),
                            child: CoinHugeContainer(
                              coin: coin,
                              greenStyle: true,
                              redStyle: false,
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              );
            }

            if (state is HomeLoadingFailure) {
              return LoadingFailure(
                restart: () => _homeBloc.add(
                  const LoadHome(),
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
