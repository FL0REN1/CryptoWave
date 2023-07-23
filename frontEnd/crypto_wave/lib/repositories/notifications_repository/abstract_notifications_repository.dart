import 'models/models.dart';

abstract class AbstractNotificationsRepository {
  Future<List<NotificationsRead>> getAllNotifications();
  Future<List<NotificationsRead>> getUnReadNotifications(int userId);
  Future<NotificationsRead> createNotifications(NotificationsCreate notificationsCreate);
  Future<NotificationsRead> deleteNotifications(NotificationsDelete notificationsDelete);
  Future<NotificationsRead> deleteAllNotifications(NotificationsDeleteAll notificationsDeleteAll);
  Future<NotificationsRead> deleteChoosenNotifications(NotificationsDeleteChoosen notificationsDeleteChoosen);
  Future<NotificationsRead> changeAllNotificationsToRead(NotificationsChangeAllToRead notificationsChangeAllToRead);
  Future<NotificationsRead> changeAllToChoosenNotifications(NotificationsChangeAllToChoosen notificationsChangeAll);
  Future<NotificationsRead> changeToChoosenNotification(NotificationsChangeToChoosen notificationsChangeToChoosen);
}
