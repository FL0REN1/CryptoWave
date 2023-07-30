import 'models/models.dart';

abstract class AbstractWalletRepository {
  Future<List<WalletRead>> getAllWallet(WalletGetAll walletGetAll);
  Future<WalletRead> getDetailsWallet(WalletGetDetails walletGetDetails);
  Future<bool> buyWallet(WalletBuy walletBuy);
  Future<bool> sellWallet(WalletSell walletSell);
  Future<bool> changeFavoriteWallet(WalletChangeFavorite walletChangeFavorite);
  Future<WalletRead> createWallet(WalletCreate walletCreate);
}
