import 'package:crypto_wave/router/router.dart';
import 'package:crypto_wave/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoWaveApp extends StatefulWidget {
  const CryptoWaveApp({super.key});

  @override
  State<CryptoWaveApp> createState() => _CryptoWaveAppState();
}

class _CryptoWaveAppState extends State<CryptoWaveApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Crypto Wave',
      theme: darkTheme,
      routerConfig: _router.config(
        navigatorObservers: () => [
          TalkerRouteObserver(GetIt.I<Talker>()),
        ],
      ),
    );
  }
}
