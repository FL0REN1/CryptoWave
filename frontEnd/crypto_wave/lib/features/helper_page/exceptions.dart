class UserNotFoundException implements Exception {
  final String message;
  UserNotFoundException({this.message = 'User not found.'});
}
