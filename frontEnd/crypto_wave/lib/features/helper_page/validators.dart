class Validators {
  // [ERROR VALIDATORS]
  static bool isValidFullName(String value) {
    if (value.length >= 2 && value.length <= 49) return true;
    return false;
  }

  static bool isValidEmail(String value) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (value.length >= 10 &&
        value.length <= 49 &&
        emailRegex.hasMatch(value)) {
      return true;
    }
    return false;
  }

  static bool isValidPassword(String value) {
    final containsLowerCase = value.contains(RegExp(r'[a-z]'));
    final containsUpperCase = value.contains(RegExp(r'[A-Z]'));
    final containsNumber = value.contains(RegExp(r'[0-9]'));
    final containsSpecialChar =
        value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    final isLengthValid = value.length >= 10 && value.length <= 49;

    if (isLengthValid &&
        containsLowerCase &&
        containsUpperCase &&
        containsNumber &&
        containsSpecialChar) return true;
    return false;
  }

  static bool isValidRepeatPassword(String value, String originalPassword) {
    if (value == originalPassword) return true;
    return false;
  }

  // [ERROR TEXT]
  static String fullNameErrorText = 'Length: 2 to 49 characters';
  static String emailErrorText =
      'Length: 10 to 49 characters. \nIt is obligatory to write in the format email@gmail.com';
  static String passwordErrorText =
      'Length: 10 to 49 characters. \nMust have a small letter, a capital letter, a number and a special character';
  static String repeatPasswordErrorText = 'The passwords must match';
}
