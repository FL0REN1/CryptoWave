namespace userNotifications.Models
{
    public interface INotificationsRep
    {
        bool SaveChanges();

        bool CreateNotification(Notifications notifications);
        bool DeleteNotification(int Id);
        bool DeleteAllNotifications(int userId);
        bool ChangeAllNotifications(int userId);
        bool ChangeSingleNotification(int Id);

        IEnumerable<Notifications> GetAllNotifications(int userId);
        IEnumerable<Notifications> GetUnReadNotifications(int userId);

    }
}
