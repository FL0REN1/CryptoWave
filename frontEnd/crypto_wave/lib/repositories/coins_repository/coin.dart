import 'package:dio/dio.dart';
import 'coins_repository.dart';
import 'models/models.dart';

class Coin implements AbstractCoinsRepository {
  final Dio dio;

  Coin({required this.dio});

  @override
  Future<List<Coins>> getCoinsList() async {
    final Response response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,USDT&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;

    final cryptoCoinsList = await Future.wait(dataRaw.entries.map((e) async {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final details = CoinsDetails.fromJson(usdData);

      final tradeData = await getCoinsTrade(e.key);
      final tradeObject1 = tradeData['Data'] as Map<String, dynamic>;
      final tradeObject2 = tradeObject1['Data'] as List<dynamic>;
      final tradeList = tradeObject2
          .map((tradeItem) => CoinsTrade.fromJson(tradeItem))
          .toList();

      return Coins(name: e.key, details: details, trade: tradeList);
    }));

    return cryptoCoinsList;
  }

  @override
  Future<Coins> getCoinDetails(String currencyCode) async {
    final responseDetails = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');
    final dataDetails = responseDetails.data as Map<String, dynamic>;
    final dataRawDetails = dataDetails['RAW'] as Map<String, dynamic>;
    final coinData = dataRawDetails[currencyCode] as Map<String, dynamic>;
    final usdDataDetails = coinData['USD'] as Map<String, dynamic>;
    final details = CoinsDetails.fromJson(usdDataDetails);

    final tradeData = await getCoinsTrade(currencyCode);
    final trade = CoinsTrade.fromJson(tradeData);

    return Coins(name: currencyCode, details: details, trade: [trade]);
  }

  Future<Map<String, dynamic>> getCoinsTrade(String coinSymbol) async {
    final Response responseTrade = await dio.get(
        'https://min-api.cryptocompare.com/data/v2/histominute?fsym=$coinSymbol&tsym=USD&limit=10&3531212fe9285f5a1acce2722b7d5aae80f248e353705b51ae0050978f756012');

    return responseTrade.data as Map<String, dynamic>;
  }
}
