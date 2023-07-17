part of 'authorization_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  bool areAllFieldsValid() {
    final emailIsValid = Validators.isValidEmail(emailController.text);
    final passwordIsValid = Validators.isValidPassword(passwordController.text);
    final repeatPasswordIsValid = Validators.isValidRepeatPassword(
        repeatPasswordController.text, passwordController.text);

    return emailIsValid && passwordIsValid && repeatPasswordIsValid;
  }

  Future<void> onLogInClick(BuildContext context) async {
    if (areAllFieldsValid()) {
      UserCheckLogin userCheckLogin = UserCheckLogin(
        email: emailController.text,
        password: passwordController.text,
      );
      await GetIt.I<AbstractUserRepository>()
          .checkUserLogin(userCheckLogin)
          .then((user) {
        showSuccessToast(
            context, 'Account log In was successful', ToastGravity.BOTTOM);
        AutoRouter.of(context).push(HomeRoute(userId: user!.id));
      }).catchError(
        (error) {
          showErrorSnackBar(context, 'User not found');
        },
      );
    } else {
      showErrorToast(context, 'Inputs validation invalid', ToastGravity.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 10),
          TextInput(
              labelText: 'Email',
              security: false,
              giveMeText: emailController,
              onTextSubmitted: (newText) {
                setState(() {
                  emailController.text = newText;
                });
              },
              errorCondition: (value) => Validators.isValidEmail(value),
              errorText: Validators.emailErrorText),
          const SizedBox(height: 20),
          TextInput(
              labelText: 'Password',
              security: true,
              giveMeText: passwordController,
              onTextSubmitted: (newText) {
                setState(() {
                  passwordController.text = newText;
                });
              },
              errorCondition: (value) => Validators.isValidPassword(value),
              errorText: Validators.passwordErrorText),
          const SizedBox(height: 20),
          TextInput(
              labelText: 'Repeat password',
              security: true,
              giveMeText: repeatPasswordController,
              onTextSubmitted: (newText) {
                setState(() {
                  repeatPasswordController.text = newText;
                });
              },
              errorCondition: (value) => Validators.isValidRepeatPassword(
                  value, passwordController.text),
              errorText: Validators.repeatPasswordErrorText),
          const SizedBox(height: 20),
          RoutedButton(
            routedButtonText: 'Log in',
            onPressed: () => onLogInClick(context),
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
