import 'package:dio/dio.dart';
import 'coins_repository.dart';
import 'models/models.dart';

class CoinRepository implements AbstractCoinsRepository {
  final Dio dio;

  CoinRepository({required this.dio});

  @override
  Future<List<Coins>> getCoinsList() async {
    final Response response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final details = CoinsDetails.fromJson(usdData);
      return Coins(name: e.key, details: details);
    }).toList();
    return cryptoCoinsList;
  }

  @override
  Future<Coins> getCoinDetails(String currencyCode) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final details = CoinsDetails.fromJson(usdData);

    return Coins(name: currencyCode, details: details);
  }
}
