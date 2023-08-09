import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_wave/features/helper_page/helper_page.dart';
import 'package:crypto_wave/features/home_page/bloc/bloc.dart';
import 'package:crypto_wave/features/home_page/widgets/widgets.dart';
import 'package:crypto_wave/repositories/coins_repository/coins_repository.dart';
import 'package:crypto_wave/repositories/wallet_repository/wallet_repository.dart';
import 'package:crypto_wave/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.userId});
  final int userId;

  @override
  State<HomePage> createState() => _HomePageState();
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class _HomePageState extends State<HomePage> {
  final _homeBloc = HomeBloc(
    GetIt.I<AbstractCoinsRepository>(),
    GetIt.I<AbstractWalletRepository>(),
  );
  List<Coin> favoriteCoins = [];

  @override
  void initState() {
    _homeBloc.add(LoadHome(completer: null, userId: widget.userId));
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
            _homeBloc
                .add(LoadHome(completer: completer, userId: widget.userId));
            return completer.future;
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            bloc: _homeBloc,
            builder: (context, state) {
              if (state is HomeLoaded) {
                final theme = Theme.of(context);
                final favoriteCoins = state.coins.where((coin) {
                  return state.wallets.any(
                    (wallet) =>
                        wallet.currencyName == coin.name && wallet.isFavorite,
                  );
                }).toList();
                return Column(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: RoutedIconButton(
                                        padding: 4,
                                        func: () {
                                          AutoRouter.of(context).push(
                                            const TutorialRoute(),
                                          );
                                        },
                                        artboard: 'ONLINE',
                                        height: 100,
                                        rivePath: 'assets/rive/icons_two.riv',
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: RoutedIconButton(
                                      padding: 8,
                                      func: () {
                                        AutoRouter.of(context).push(
                                          SearchRoute(userId: widget.userId),
                                        );
                                      },
                                      artboard: 'SEARCH',
                                      height: 45,
                                      rivePath: 'assets/rive/icons.riv',
                                      width: 45,
                                    ),
                                  ),
                                  RoutedIconButton(
                                    padding: 8,
                                    func: () {
                                      AutoRouter.of(context).push(
                                        NotificationsRoute(userId: widget.userId),
                                      );
                                    },
                                    artboard: 'BELL',
                                    height: 45,
                                    rivePath: 'assets/rive/icons.riv',
                                    width: 45,
                                  ),
                                ],
                              ),
                            ),
                            favoriteCoins.isNotEmpty
                                ? Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    child: Text(
                                      'Favorites',
                                      style: theme.textTheme.labelMedium,
                                    ),
                                  )
                                : const SizedBox(),
                            favoriteCoins.isNotEmpty
                                ? const SizedBox(height: 20)
                                : const SizedBox(),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: favoriteCoins.isNotEmpty
                                  ? Row(
                                      children: List.generate(
                                          favoriteCoins.length, (int index) {
                                        final coin = favoriteCoins[index];
                                        bool isLastElement =
                                            index == favoriteCoins.length - 1;

                                        return Container(
                                          margin: isLastElement
                                              ? EdgeInsets.zero
                                              : const EdgeInsets.only(
                                                  right: 20),
                                          child: CoinHugeContainer(
                                            coin: coin,
                                          ),
                                        );
                                      }),
                                    )
                                  : null,
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
                            SizedBox(
                              height: favoriteCoins.isNotEmpty ? 105 : null,
                              child: ListView.separated(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(top: 20),
                                separatorBuilder: (context, state) =>
                                    const Divider(thickness: 2),
                                itemCount: state.coins.length,
                                itemBuilder: (context, i) {
                                  final coin = state.coins[i];
                                  return CoinSmallContainer(
                                    coin: coin,
                                    currencyCode: coin.name,
                                    userId: widget.userId,
                                    currencyName: coin.name,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    favoriteCoins.isNotEmpty
                        ? const SizedBox()
                        : const Spacer(
                            flex: 1,
                          ),
                    NavigationBottom(
                      selectedIndex: 0,
                      userId: widget.userId,
                    ),
                  ],
                );
              }

              if (state is HomeLoadingFailure) {
                return LoadingFailure(
                  restart: () => _homeBloc.add(
                    LoadHome(completer: null, userId: widget.userId),
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
