import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_wave/features/coin_page/bloc/bloc.dart';
import 'package:crypto_wave/features/helper_page/helper_page.dart';
import 'package:crypto_wave/repositories/coins_repository/coins_repository.dart';
import 'package:crypto_wave/repositories/wallet_repository/wallet_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class CoinPage extends StatefulWidget {
  const CoinPage({
    super.key,
    required this.currencyCode,
    required this.userId,
    required this.currencyName,
  });
  final String currencyCode;
  final int userId;
  final String currencyName;

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  final _coinBloc = CoinBloc(
    GetIt.I<AbstractCoinsRepository>(),
    GetIt.I<AbstractWalletRepository>(),
  );
  bool isFavorite = false;

  @override
  void initState() {
    _coinBloc.add(LoadCoin(
      completer: null,
      currencyCode: widget.currencyCode,
      userId: widget.userId,
      currencyName: widget.currencyName,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        final completer = Completer();
        _coinBloc.add(
          LoadCoin(
            completer: null,
            currencyCode: widget.currencyCode,
            userId: widget.userId,
            currencyName: widget.currencyName,
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
          title: const Text('BTC/USDT'),
          centerTitle: true,
          actions: [
            IconButton(
              splashRadius: 20,
              onPressed: () {
                _coinBloc.add(
                  LoadFavoriteChangeCoin(
                    completer: null,
                    currencyCode: widget.currencyCode,
                    userId: widget.userId,
                    currencyName: widget.currencyName,
                  ),
                );
              },
              icon: const Icon(Icons.favorite_border),
            )
          ],
        ),
        body: BlocBuilder<CoinBloc, CoinState>(
          bloc: _coinBloc,
          builder: (context, state) {
            if (state is CoinLoaded) {
              isFavorite = state.wallet.isFavorite;
              return const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[Text('123')],
                  ),
                ),
              );
            }

            if (state is CoinLoadingFailure) {
              return LoadingFailure(
                restart: () => _coinBloc.add(LoadCoin(
                  completer: null,
                  currencyCode: widget.currencyCode,
                  userId: widget.userId,
                  currencyName: widget.currencyName,
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
