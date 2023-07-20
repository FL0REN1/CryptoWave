import 'models/models.dart';

abstract class AbstractNotificationsRepository {
  Future<List<NotificationsRead>> getAllNotifications();
  Future<List<NotificationsRead>> getUnReadNotifications(int userId);
  Future<NotificationsRead> createNotifications(NotificationsCreate notificationsCreate);
  Future<NotificationsRead> deleteNotifications(NotificationsDelete notificationsDelete);
  Future<NotificationsRead> deleteAllNotifications(NotificationsDeleteAll ntificationsDeleteAll);
  Future<NotificationsRead> changeAllNotifications(NotificationsChange notificationsChange);
}
