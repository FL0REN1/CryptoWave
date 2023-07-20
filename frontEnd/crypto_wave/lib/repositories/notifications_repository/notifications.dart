import 'package:crypto_wave/repositories/notifications_repository/models/models.dart';
import 'package:crypto_wave/repositories/notifications_repository/notifications_repository.dart';
import 'package:dio/dio.dart';

class Notifications implements AbstractNotificationsRepository {
  final Dio dio;

  Notifications({required this.dio});

  @override
  Future<NotificationsRead> changeAllNotifications(
      NotificationsChange notificationsChange) async {
    final Response response = await dio.put(
      'http://10.0.2.2:5217/api/Notifications/change',
      data: notificationsChange,
    );
    final dynamic notificationsResponse = response.data;
    final NotificationsRead notifications = notificationsResponse.map(
      (json) => NotificationsRead.fromJson(json),
    );
    return notifications;
  }

  @override
  Future<NotificationsRead> createNotifications(
      NotificationsCreate notificationsCreate) async {
    final Response response = await dio.post(
      'http://10.0.2.2:5217/api/Notifications',
      data: notificationsCreate.toJson(),
    );
    final dynamic notificationsResponse = response.data;
    final NotificationsRead notifications = NotificationsRead.fromJson(
      notificationsResponse,
    );
    return notifications;
  }

  @override
  Future<NotificationsRead> deleteAllNotifications(
      NotificationsDeleteAll notificationsDeleteAll) async {
    final Response response = await dio.delete(
      'http://10.0.2.2:5217/api/Notifications/deleteAll',
      data: notificationsDeleteAll,
    );
    final dynamic notificationsResponse = response.data;
    final NotificationsRead notifications = notificationsResponse.map(
      (json) => NotificationsRead.fromJson(json),
    );
    return notifications;
  }

  @override
  Future<NotificationsRead> deleteNotifications(
      NotificationsDelete notificationsDelete) async {
    final Response response = await dio.delete(
      'http://10.0.2.2:5217/api/Notifications/delete',
      data: notificationsDelete,
    );
    final dynamic notificationsResponse = response.data;
    final NotificationsRead notifications = notificationsResponse.map(
      (json) => NotificationsRead.fromJson(json),
    );
    return notifications;
  }

  @override
  Future<List<NotificationsRead>> getAllNotifications() async {
    final Response response = await dio.get(
      'http://10.0.2.2:5217/api/Notifications/all?userId=0',
    );
    final List<dynamic> notificationsResponse = response.data;
    final List<NotificationsRead> notificationss = notificationsResponse
        .map((json) => NotificationsRead.fromJson(json))
        .toList();
    return notificationss;
  }

  @override
  Future<List<NotificationsRead>> getUnReadNotifications(
      int notificationsId) async {
    final Response response = await dio.get(
      'http://10.0.2.2:5217/api/Notifications/UnRead?userId=0',
    );
    final List<dynamic> notificationsResponse = response.data;
    final List<NotificationsRead> notificationss = notificationsResponse
        .map((json) => NotificationsRead.fromJson(json))
        .toList();
    return notificationss;
  }
}
