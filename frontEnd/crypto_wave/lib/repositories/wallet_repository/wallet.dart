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
        .get('http://10.0.2.2:5211/api/Wallet/details', data: getDetailsWallet);
    final dynamic userResponse = response.data;
    final WalletRead walletRead = WalletRead.fromJson(userResponse);
    return walletRead;
  }

  @override
  Future<WalletRead> changeWallet(WalletChange walletChange) async {
    final Response response = await dio.post(
      'http://10.0.2.2:5211/api/Wallet/change',
      data: walletChange,
    );
    final dynamic walletResponse = response.data;
    final WalletRead wallet = WalletRead.fromJson(walletResponse);
    return wallet;
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
