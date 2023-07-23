import 'models/models.dart';

abstract class AbstractWalletRepository {
  Future<List<WalletRead>> getAllWallet(int userId);
  Future<WalletRead> changeWallet(WalletChange walletChange);
  Future<WalletRead> createWallet(WalletCreate walletCreate);
}
