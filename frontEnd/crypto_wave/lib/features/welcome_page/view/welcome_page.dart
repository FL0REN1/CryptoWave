import 'package:auto_route/auto_route.dart';
import 'package:crypto_wave/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'CRYPTO',
                    style: theme.textTheme.headlineLarge,
                  ),
                  Text(
                    'W',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      color: const Color(0xFF41B3CC),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Image.asset('assets/images/wave_img.png'),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              height: 100,
              child: Text(
                'Start your rich story with Crypto Wave',
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
            OutlinedButton(
              onPressed: () {
                AutoRouter.of(context).push(const RegistrationRoute());
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Text('Get Started'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'free 100 USDT after registration',
              style: theme.textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
