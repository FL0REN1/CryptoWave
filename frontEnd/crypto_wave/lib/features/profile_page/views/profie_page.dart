import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_wave/features/helper_page/helper_page.dart';
import 'package:crypto_wave/features/home_page/widgets/coin_small_container.dart';
import 'package:crypto_wave/features/profile_page/bloc/bloc.dart';
import 'package:crypto_wave/features/profile_page/widgets/doughunt_chart.dart';
import 'package:crypto_wave/repositories/coins_repository/coins_repository.dart';
import 'package:crypto_wave/repositories/coins_repository/models/models.dart';
import 'package:crypto_wave/repositories/wallet_repository/abstract_wallet_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.userId});
  final int userId;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _profileBloc = ProfileBloc(
    GetIt.I<AbstractWalletRepository>(),
    GetIt.I<AbstractCoinsRepository>(),
  );
  bool eyeVisibility = true;

  @override
  void initState() {
    _profileBloc.add(LoadProfile(completer: null, userId: widget.userId));

    _profileBloc.startUpdatingWallet(userId: widget.userId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _profileBloc.add(LoadProfile(completer: completer, userId: widget.userId));
            return completer.future;
          },
          child: BlocBuilder<ProfileBloc, ProfileState>(
            bloc: _profileBloc,
            builder: (context, state) {
              if (state is ProfileLoaded) {
                List<Coins> filteredCoins = [];
                for (int i = 0; i < state.coins.length; i++) {
                  Coins coin = state.coins[i];
                  for (int j = 0; j < state.wallet.length; j++) {
                    if (coin.name == state.wallet[j].currencyName) {
                      filteredCoins.add(coin);
                    }
                  }
                }
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Overview',
                                style: theme.textTheme.bodyMedium,
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    eyeVisibility = !eyeVisibility;
                                  });
                                },
                                child: eyeVisibility
                                    ? const Icon(
                                        Icons.visibility,
                                        color:
                                            Color.fromARGB(179, 255, 255, 255),
                                      )
                                    : const Icon(
                                        Icons.visibility_off,
                                        color:
                                            Color.fromARGB(179, 255, 255, 255),
                                      ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Center(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              width: 350,
                              height: 300,
                              margin: const EdgeInsets.only(bottom: 30),
                              decoration: BoxDecoration(
                                color: eyeVisibility
                                    ? const Color.fromRGBO(193, 214, 233, 1)
                                    : const Color.fromARGB(255, 122, 145, 165),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    spreadRadius: -10,
                                    blurRadius: 17,
                                    offset: Offset(-5, -5),
                                    color: Colors.white,
                                  ),
                                  BoxShadow(
                                    spreadRadius: -2,
                                    blurRadius: 10,
                                    offset: Offset(7, 7),
                                    color: Color.fromRGBO(146, 182, 216, 1),
                                  ),
                                ],
                              ),
                              child: eyeVisibility
                                  ? DoughuntChart(
                                      wallet: state.wallet
                                          .where((e) =>
                                              e.currencyName != 'NULL_COIN')
                                          .toList(),
                                    )
                                  : const Icon(Icons.hide_image),
                            ),
                          ),
                          Text(
                            'Your crypto',
                            style: theme.textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 105,
                            child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(top: 20),
                              separatorBuilder: (context, state) =>
                                  const Divider(thickness: 2),
                              itemCount: filteredCoins.length,
                              itemBuilder: (context, i) {
                                Coins coin = filteredCoins[i];
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
                    const Spacer(),
                    NavigationBottom(
                      selectedIndex: 3,
                      userId: widget.userId,
                    ),
                  ],
                );
              }

              if (state is ProfileLoadingFailure) {
                return LoadingFailure(
                  restart: () => _profileBloc.add(
                    LoadProfile(completer: null, userId: widget.userId),
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
