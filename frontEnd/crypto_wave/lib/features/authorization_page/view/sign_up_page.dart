part of 'authorization_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 10),
          const TextInput(labelText: 'First Name', security: false),
          const SizedBox(height: 20),
          const TextInput(labelText: 'Last Name', security: false),
          const SizedBox(height: 20),
          const TextInput(labelText: 'Email', security: false),
          const SizedBox(height: 20),
          const TextInput(labelText: 'Password', security: true),
          const SizedBox(height: 20),
          const TextInput(labelText: 'Repeat password', security: true),
          const CheckBox(labelText: 'I Agree to Terms and Conditions'),
          RoutedButton(
            routedButtonText: 'Create',
            onPressed: () {},
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
