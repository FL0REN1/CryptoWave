import 'package:crypto_wave/repositories/wallet_repository/models/models.dart';
import 'package:equatable/equatable.dart';
import 'models.dart';

class Coins extends Equatable {
  final String name;
  final CoinsDetails details;
  final List<CoinsTrade> trade;
  final WalletRead wallet;

  const Coins({
    required this.name,
    required this.details,
    required this.trade,
    required this.wallet
  });

  @override
  List<Object> get props => [name, details, trade, wallet];
}
