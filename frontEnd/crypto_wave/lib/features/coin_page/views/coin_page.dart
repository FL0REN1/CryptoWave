import 'dart:async';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_wave/features/coin_page/bloc/bloc.dart';
import 'package:crypto_wave/features/coin_page/widgets/widgets.dart';
import 'package:crypto_wave/features/helper_page/helper_page.dart';
import 'package:crypto_wave/repositories/coins_repository/coins_repository.dart';
import 'package:crypto_wave/repositories/coins_repository/models/models.dart';
import 'package:crypto_wave/repositories/wallet_repository/models/models.dart';
import 'package:crypto_wave/repositories/wallet_repository/wallet_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class CoinPage extends StatefulWidget {
  const CoinPage({
    super.key,
    required this.userId,
    required this.currencyCode,
    required this.currencyName,
  });
  final int userId;

  final String currencyCode;
  final String currencyName;

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  final _coinBloc = CoinBloc(
    GetIt.I<AbstractCoinsRepository>(),
    GetIt.I<AbstractWalletRepository>(),
  );

  bool? isFavorite;
  bool dataLoaded = false;
  bool isBuy = true;

  String title = "";

  TextEditingController currentCoinController = TextEditingController();
  TextEditingController otherCoinController = TextEditingController();

  Coins? coinSecond = const Coins(
    name: 'Touch',
    details: CoinsDetails(
      toSymbol: 'It',
      highDay: 0,
      lowDay: 0,
      priceInUSD: 0,
      precentInUSD: 0,
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1536/1536384.png',
    ),
    trade: [],
    wallet: WalletRead(
      id: 0,
      currencyCount: 0,
      currencyName: '',
      userId: 0,
      isFavorite: false,
    ),
  );
  WalletRead? walletSecond = const WalletRead(
    currencyCount: 0,
    currencyName: '',
    id: 0,
    isFavorite: false,
    userId: 0,
  );

  @override
  void initState() {
    _coinBloc.add(LoadDataEvent(
      completer: null,
      currencyCode: widget.currencyCode,
      userId: widget.userId,
      currencyName: widget.currencyName,
      dataType: LoadDataType.allCoins,
      currencyCount: 0,
      currencyToSell: '',
      currencyToBuy: '',
      currencyToBuyPriceInUsd: 0,
      currencyToSellPriceInUsd: 0,
    ));

    // _coinBloc.startUpdatingCoins(
    //   widget.currencyCode,
    //   widget.userId,
    //   widget.currencyName,
    // );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        final completer = Completer();
        _coinBloc.add(
          LoadDataEvent(
            completer: null,
            currencyCode: widget.currencyCode,
            userId: widget.userId,
            currencyName: widget.currencyName,
            dataType: LoadDataType.coinDetails,
            currencyCount: 0,
            currencyToSell: '',
            currencyToBuy: '',
            currencyToBuyPriceInUsd: 0,
            currencyToSellPriceInUsd: 0,
          ),
        );
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
            title: BlocBuilder<CoinBloc, CoinState>(
              bloc: _coinBloc,
              builder: (context, state) {
                if (state is CoinLoaded) {
                  title =
                      "${state.wallet!.currencyName}/${state.coin!.details.toSymbol}";
                }
                return Text(title);
              },
            ),
            centerTitle: true,
            actions: [
              IconButton(
                splashRadius: 20,
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite!;
                  });
                  _coinBloc.add(
                    LoadDataEvent(
                      completer: null,
                      currencyCode: widget.currencyCode,
                      userId: widget.userId,
                      currencyName: widget.currencyName,
                      dataType: LoadDataType.change,
                      currencyCount: 0,
                      currencyToSell: '',
                      currencyToBuy: '',
                      currencyToBuyPriceInUsd: 0,
                      currencyToSellPriceInUsd: 0,
                    ),
                  );
                },
                icon: BlocBuilder<CoinBloc, CoinState>(
                  bloc: _coinBloc,
                  builder: (context, state) {
                    if (isFavorite == null && state is CoinLoaded) {
                      isFavorite = state.wallet!.isFavorite;
                      dataLoaded = true;
                    }
                    return dataLoaded
                        ? Icon(
                            isFavorite ?? false
                                ? Icons.favorite
                                : Icons.favorite_border,
                          )
                        : Container();
                  },
                ),
              )
            ]),
        body: BlocBuilder<CoinBloc, CoinState>(
          bloc: _coinBloc,
          builder: (context, state) {
            if (state is CoinLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white
                                  .withOpacity(0.2), // Белое свечение
                              spreadRadius: 10,
                              blurRadius: 20,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 77, 75, 75),
                                    Color(0xFF171717),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: CoinGraphicRichest(coin: state.coin),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: isBuy
                                ? [
                                    const Color.fromARGB(255, 56, 73, 82),
                                    const Color.fromARGB(255, 29, 66, 30),
                                  ]
                                : [
                                    const Color.fromARGB(255, 56, 73, 82),
                                    const Color.fromARGB(255, 99, 29, 24),
                                  ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: CoinBuySell(
                          coin: state.coin,
                          currentCoinController: currentCoinController,
                          otherCoinController: otherCoinController,
                          buyFunc: () {
                            setState(() {
                              isBuy = true;
                            });
                          },
                          sellFunc: () {
                            setState(() {
                              isBuy = false;
                            });
                          },
                          isBuy: isBuy,
                          coinSecond: coinSecond,
                          coinsList: state.listCoins,
                          onChanged: (coins) {
                            setState(() {
                              coinSecond = coins;
                            });
                          },
                          buyFuncBtn: () {
                            _coinBloc.add(LoadDataEvent(
                              completer: null,
                              currencyCode: widget.currencyCode,
                              userId: widget.userId,
                              currencyName: widget.currencyName,
                              dataType: LoadDataType.buyCoin,
                              currencyCount:
                                  double.tryParse(currentCoinController.text) ??
                                      0.0,
                              currencyToSell: coinSecond!.name,
                              currencyToBuy: state.coin!.name,
                              currencyToBuyPriceInUsd:
                                  state.coin!.details.priceInUSD,
                              currencyToSellPriceInUsd:
                                  coinSecond!.details.priceInUSD,
                            ));
                          },
                          sellFuncBtn: () {
                            _coinBloc.add(LoadDataEvent(
                              completer: null,
                              currencyCode: widget.currencyCode,
                              userId: widget.userId,
                              currencyName: widget.currencyName,
                              dataType: LoadDataType.sellCoin,
                              currencyCount:
                                  double.tryParse(currentCoinController.text) ??
                                      0.0,
                              currencyToSell: state.coin!.name,
                              currencyToBuy: coinSecond!.name,
                              currencyToBuyPriceInUsd:
                                  coinSecond!.details.priceInUSD,
                              currencyToSellPriceInUsd:
                                  state.coin!.details.priceInUSD,
                            ));
                          },
                          wallet: state.wallet,
                          walletSecond: walletSecond,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (state is CoinLoadingFailure) {
              return LoadingFailure(
                restart: () => _coinBloc.add(LoadDataEvent(
                  completer: null,
                  currencyCode: widget.currencyCode,
                  userId: widget.userId,
                  currencyName: widget.currencyName,
                  dataType: LoadDataType.coinDetails,
                  currencyCount: 0,
                  currencyToSell: '',
                  currencyToBuy: '',
                  currencyToBuyPriceInUsd: 0,
                  currencyToSellPriceInUsd: 0,
                )),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
