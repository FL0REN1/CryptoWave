import 'package:crypto_wave/features/helper_page/helper_page.dart';

import 'abstract_user_repository.dart';
import 'package:dio/dio.dart';
import 'models/models.dart';

class User implements AbstractUserRepository {
  final Dio dio;

  User({required this.dio});

  @override
  Future<List<UserRead>> getAllUsers() async {
    final Response response = await dio.get(
      'http://10.0.2.2:5235/api/User/all',
    );
    final List<dynamic> userResponse = response.data;
    final List<UserRead> users =
        userResponse.map((json) => UserRead.fromJson(json)).toList();
    return users;
  }

  @override
  Future<UserRead> getUserById(int id) async {
    final Response response = await dio.get(
      'http://10.0.2.2:5235/api/User/id?id=$id',
    );
    final dynamic userResponse = response.data;
    final UserRead user = UserRead.fromJson(userResponse);
    return user;
  }

  @override
  Future<UserRead> createUser(UserCreate userCreate) async {
    final Response response = await dio.post(
      'http://10.0.2.2:5235/api/User',
      data: userCreate.toJson(),
    );
    final dynamic userResponse = response.data;
    final UserRead user = UserRead.fromJson(userResponse);
    return user;
  }

  @override
  Future<UserRead> deleteUser(UserDelete userDelete) async {
    final Response response =
        await dio.delete('http://10.0.2.2:5235/api/User', data: userDelete);
    final dynamic userResponse = response.data;
    final UserRead user = userResponse.map((json) => UserRead.fromJson(json));
    return user;
  }

  @override
  Future<UserRead> changeUser(UserChange userChange) async {
    final Response response =
        await dio.put('http://10.0.2.2:5235/api/User/change', data: userChange);
    final dynamic userResponse = response.data;
    final UserRead user = userResponse.map((json) => UserRead.fromJson(json));
    return user;
  }

  @override
  Future<UserRead?> checkUserLogin(UserCheckLogin userCheckLogin) async {
    try {
      final Response response = await dio.post(
          'http://10.0.2.2:5235/api/User/login',
          data: userCheckLogin.toJson());
      final dynamic userResponse = response.data;
      final UserRead user = UserRead.fromJson(userResponse);
      return user;
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        throw UserNotFoundException();
      } else {
        rethrow;
      }
    }
  }
}
