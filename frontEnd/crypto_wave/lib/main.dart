import 'package:crypto_wave/crypto_wave_app.dart';
import 'package:crypto_wave/repositories/user_repository/abstract_user_repository.dart';
import 'package:crypto_wave/repositories/user_repository/user.dart';
import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'repositories/coins_repository/coins_repository.dart';

Future<void> main() async {
  // [INIT]
  final talker = TalkerFlutter.init();
  final dio = Dio();
  dio.options.contentType = 'application/json';

  // [LOGGER]
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printResponseData: false,
      ),
    ),
  );
  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
      printEventFullData: false,
      printStateFullData: false,
    ),
  );
  FlutterError.onError = (details) => GetIt.I<Talker>().handle(
        details.exception,
        details.stack,
      );

  // [GET_IT]
  GetIt.I.registerSingleton(talker);
  GetIt.I.registerLazySingleton<AbstractUserRepository>(
    () => User(dio: dio),
  );
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
    () => CoinRepository(dio: dio),
  );

  // [OTHER]
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const CryptoWaveApp());
}
