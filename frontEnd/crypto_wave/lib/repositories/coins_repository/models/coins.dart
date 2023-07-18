import 'package:equatable/equatable.dart';
import 'models.dart';

class Coins extends Equatable {
  final String name;
  final CoinsDetails details;

  const Coins({required this.name, required this.details});

  @override
  List<Object> get props => [name, details];
}
