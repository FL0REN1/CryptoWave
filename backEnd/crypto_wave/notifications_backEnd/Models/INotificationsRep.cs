using userNotifications.Models.Dto;

namespace userNotifications.Models
{
    public interface INotificationsRep
    {
        bool SaveChanges();

        bool CreateNotification(Notifications notifications);
        bool DeleteNotification(int Id);
        bool DeleteAllNotifications(int userId);
        bool DeleteChoosenNotifications(int userId);
        bool ChangeToChoosenAllNotifications(int userId);
        bool ChangeToReadAllNotifications(int userId);
        bool ChangeToChoosenNotification(int Id);

        IEnumerable<Notifications> GetAllNotifications(int userId);
        IEnumerable<Notifications> GetUnReadNotifications(int userId);

    }
}
