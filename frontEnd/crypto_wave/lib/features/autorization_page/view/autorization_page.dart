import 'package:auto_route/auto_route.dart';
import 'package:crypto_wave/features/autorization_page/widgets/widgets.dart';
import 'package:crypto_wave/features/welcome_page/widgets/widgets.dart';
import 'package:flutter/material.dart';

part 'log_in_page.dart';
part 'sign_up_page.dart';

@RoutePage()
class AutorizationPage extends StatefulWidget {
  const AutorizationPage({super.key});

  @override
  State<AutorizationPage> createState() => _AutorizationPageState();
}

class _AutorizationPageState extends State<AutorizationPage> {
  bool selectedTab = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          splashRadius: 20,
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'CRYPTO',
                style: theme.textTheme.titleLarge,
              ),
              TextSpan(
                text: ' WAVE',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: const Color(0xff41b3cc),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
          ), // Здесь устанавливаем нужный отступ
          child: Column(
            children: <Widget>[
              RoutedTextTabs(
                firstTabName: 'Login with email',
                secondTabName: 'Create account',
                firstTabFunc: () => setState(() {
                  selectedTab = true;
                }),
                secondTabFunc: () => setState(() {
                  selectedTab = false;
                }),
              ),
              selectedTab ? const LogInPage() : const SignUpPage(),
            ],
          ),
        ),
      ),
    );
  }
}
