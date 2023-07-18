import 'models/models.dart';

abstract class AbstractCoinsRepository {
  Future<List<Coins>> getCoinsList();
  Future<Coins> getCoinDetails(String currencyCode);
}
