import 'models/models.dart';

abstract class AbstractUserRepository {
  Future<List<UserRead>> getAllUsers();
  Future<UserRead> getUserById(int id);
  Future<UserRead> createUser(UserCreate userCreate);
  Future<UserRead> deleteUser(UserDelete userDelete);
  Future<UserRead> changeUser(UserChange userChange);
  Future<UserRead> checkUserLogin(UserCheckLogin userCheckLogin);
}
