import 'models/models.dart';

abstract class AbstractWalletRepository {
  Future<List<WalletRead>> getAllWallet(WalletGetAll walletGetAll);
  Future<WalletRead> getDetailsWallet(WalletGetDetails walletGetDetails);
  Future<WalletRead> changeWallet(WalletChange walletChange);
  Future<bool> changeFavoriteWallet(WalletChangeFavorite walletChangeFavorite);
  Future<WalletRead> createWallet(WalletCreate walletCreate);
}
