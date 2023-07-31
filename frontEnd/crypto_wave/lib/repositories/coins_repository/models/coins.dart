 import 'package:equatable/equatable.dart';
import 'models.dart';

class Coins extends Equatable {
  final String name;
  final CoinsDetails details;
  final List<CoinsTrade> trade;

  const Coins({
    required this.name,
    required this.details,
    required this.trade,
  });

  @override
  List<Object> get props => [name, details, trade];
}
