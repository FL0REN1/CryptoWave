import 'package:auto_route/auto_route.dart';
import 'package:crypto_wave/features/helper_page/helper_page.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EarnPage extends StatelessWidget {
  const EarnPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text('Page is under development',
                    style: theme.textTheme.bodyLarge),
              ),
            ),
            const NavigationBottom(selectedIndex: 2),
          ],
        ),
      ),
    );
  }
}
