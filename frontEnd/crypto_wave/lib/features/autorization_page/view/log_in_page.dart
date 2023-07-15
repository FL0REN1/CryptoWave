part of 'autorization_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 10),
          const TextInput(labelText: 'Email', security: false),
          const SizedBox(height: 20),
          const TextInput(labelText: 'Password', security: true),
          const SizedBox(height: 20),
          const TextInput(labelText: 'Repeat password', security: true),
          const SizedBox(height: 20),
          RoutedButton(
            routedButtonText: 'Log in',
            onPressed: () {},
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
