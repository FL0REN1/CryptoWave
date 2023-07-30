import 'package:crypto_wave/repositories/wallet_repository/wallet_repository.dart';
import 'package:dio/dio.dart';

import 'models/models.dart';

class Wallet implements AbstractWalletRepository {
  final Dio dio;

  Wallet({required this.dio});

  @override
  Future<List<WalletRead>> getAllWallet(WalletGetAll walletGetAll) async {
    final Response response = await dio
        .get('http://10.0.2.2:5211/api/Wallet/all', data: walletGetAll);
    final List<dynamic> walletResponse = response.data;
    final List<WalletRead> wallets =
        walletResponse.map((json) => WalletRead.fromJson(json)).toList();
    return wallets;
  }

  @override
  Future<WalletRead> getDetailsWallet(WalletGetDetails walletGetDetails) async {
    final Response response = await dio
        .get('http://10.0.2.2:5211/api/Wallet/details', data: walletGetDetails);
    final dynamic walletResponse = response.data;
    final WalletRead walletRead = WalletRead.fromJson(walletResponse);
    return walletRead;
  }

  @override
  Future<bool> buyWallet(WalletBuy walletBuy) async {
    await dio.post(
      'http://10.0.2.2:5211/api/Wallet/buyCrypto',
      data: walletBuy,
    );
    return true;
  }

  @override
  Future<bool> sellWallet(WalletSell walletSell) async {
    await dio.post(
      'http://10.0.2.2:5211/api/Wallet/sellCrypto',
      data: walletSell,
    );
    return true;
  }

  @override
  Future<bool> changeFavoriteWallet(
    WalletChangeFavorite walletChangeFavorite,
  ) async {
    await dio.post(
      'http://10.0.2.2:5211/api/Wallet/changeFavorite',
      data: walletChangeFavorite,
    );
    return true;
  }

  @override
  Future<WalletRead> createWallet(WalletCreate walletCreate) async {
    final Response response = await dio
        .post('http://10.0.2.2:5211/api/Wallet/create', data: walletCreate);
    final dynamic walletResponse = response.data;
    final WalletRead wallet = WalletRead.fromJson(walletResponse);
    return wallet;
  }
}
