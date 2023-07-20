part of 'authorization_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  bool stateChecker = false;

  bool areAllFieldsValid() {
    final firstNameValid = Validators.isValidFullName(firstNameController.text);
    final lastNameValid = Validators.isValidFullName(lastNameController.text);
    final emailIsValid = Validators.isValidEmail(emailController.text);
    final passwordIsValid = Validators.isValidPassword(passwordController.text);
    final repeatPasswordIsValid = Validators.isValidRepeatPassword(
        repeatPasswordController.text, passwordController.text);

    return firstNameValid &&
        lastNameValid &&
        emailIsValid &&
        passwordIsValid &&
        repeatPasswordIsValid &&
        stateChecker;
  }

  void onSignUp(BuildContext context) async {
    if (areAllFieldsValid()) {
      UserCheckLogin userCheckLogin = UserCheckLogin(
        email: emailController.text,
        password: passwordController.text,
      );
      UserCreate userCreate = UserCreate(
        fullName: '${firstNameController.text} ${lastNameController.text}',
        email: emailController.text,
        password: passwordController.text,
        isVerifiedMail: false,
        isVerifiedUser: false,
      );
      await GetIt.I<AbstractUserRepository>()
          .checkUserLogin(userCheckLogin)
          .then((user) {
        if (user != null) {
          showErrorSnackBar(context, 'We already have the same user in our db');
        }
      }).catchError((e) {
        if (e is UserNotFoundException) {
          GetIt.I<AbstractUserRepository>().createUser(userCreate).then((user) {
            AutoRouter.of(context).push(const HomeRoute());
            showSuccessToast(context, 'The creation of the user was successful',
                ToastGravity.BOTTOM);
          });
        }
      });
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
              labelText: 'First Name',
              security: false,
              giveMeText: firstNameController,
              onTextSubmitted: (newText) {
                setState(() {
                  firstNameController.text = newText;
                });
              },
              errorCondition: (value) => Validators.isValidFullName(value),
              errorText: Validators.fullNameErrorText),
          const SizedBox(height: 20),
          TextInput(
              labelText: 'Last Name',
              security: false,
              giveMeText: lastNameController,
              onTextSubmitted: (newText) {
                setState(() {
                  lastNameController.text = newText;
                });
              },
              errorCondition: (value) => Validators.isValidFullName(value),
              errorText: Validators.fullNameErrorText),
          const SizedBox(height: 20),
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
          CheckBox(
            labelText: 'I Agree to Terms and Conditions',
            giveMeState: stateChecker,
            onStateChanged: (bool value) {
              setState(() {
                stateChecker = value;
              });
            },
          ),
          RoutedTextIconButton(
            routedButtonText: 'Create',
            onPressed: () => onSignUp(context),
            width: double.infinity,
            flutterIcon: null,
            paddingVertical: 20,
            paddingHorizontal: 100,
          ),
        ],
      ),
    );
  }
}
