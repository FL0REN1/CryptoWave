using crypto_wave.Models.NotificationsModel;

namespace userNotifications.Models
{
    public class NotificationsRep : INotificationsRep
    {
        #region [DATA]

        private readonly NotificationsContext _context;

        #endregion

        /// <summary>
        /// [USER_REP CONSTRUCTOR]
        /// </summary>
        /// <param name="context"></param>
        public NotificationsRep(NotificationsContext context)
        {
            _context = context;
        }


        #region [INTERFACE_IMPLEMENTION]

        /// <summary>
        /// [CREATE NOTIFICATION]
        /// </summary>
        /// <param name="notifications"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public bool CreateNotification(Notifications notifications)
        {
            if (notifications == null)
            {
                string message = "[X] Failed to create user because it is empty";
                NotificationsRabbitMQ.NotificationsErrorMQ.SendMessage(message);
                return false;
            }
            _context.Notifications?.Add(notifications);
            return true;
        }

        /// <summary>
        /// [DELETE_NOTIFICATION]
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="Id"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public bool DeleteNotification(int Id)
        {
            Notifications? notifications = _context.Notifications?.FirstOrDefault(m => m.Id == Id);
            if (notifications == null)
            {
                string message = "[X] Failed to delete user because it is empty";
                NotificationsRabbitMQ.NotificationsErrorMQ.SendMessage(message);
                return false;
            }
            _context.Notifications?.Remove(notifications);
            return true;
        }

        /// <summary>
        /// [DELETE_ALL_NOTIFICATIONS]
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public bool DeleteAllNotifications(int userId)
        {
            List<Notifications> notificationsToDelete = _context.Notifications.Where(m => m.UserId == userId).ToList();

            if (notificationsToDelete == null || notificationsToDelete.Count == 0)
            {
                string message = "[X] Failed to delete notifications because they are empty or not found";
                NotificationsRabbitMQ.NotificationsErrorMQ.SendMessage(message);
                return false;
            }

            _context.Notifications?.RemoveRange(notificationsToDelete);

            return true;
        }

        /// <summary>
        /// [CHANGE_NOTIFICATION]
        /// </summary>
        /// <param name="notifications"></param>
        /// <param name="userId"></param>
        /// <param name="Id"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public bool ChangeAllNotifications(int userId)
        {
            var notificationsToChange = _context.Notifications?.Where(n => n.UserId == userId);

            if (notificationsToChange == null || !notificationsToChange.Any())
            {
                string message = $"[X] Failed to change notifications for user with ID: {userId}. User not found or no matching notifications.";
                NotificationsRabbitMQ.NotificationsErrorMQ.SendMessage(message);
                return false;
            }

            foreach (var notification in notificationsToChange)
            {
                notification.IsRead = true;
            }

            return true;
        }

        /// <summary>
        /// [GET_ALL_NOTIFICATIONS]
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public IEnumerable<Notifications> GetAllNotifications(int userId)
        {
            return _context.Notifications?.Where(n => n.UserId == userId).ToList() ?? Enumerable.Empty<Notifications>();
        }

        /// <summary>
        /// [GET_UN_READ_NOTIFICATIONS]
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public IEnumerable<Notifications> GetUnReadNotifications(int userId)
        {
            return _context.Notifications?.Where(n => n.UserId == userId && n.IsRead == false).ToList() ?? Enumerable.Empty<Notifications>();
        }

        /// <summary>
        /// [SAVE_CHANGES]
        /// </summary>
        /// <returns></returns>
        public bool SaveChanges()
        {
            return _context.SaveChanges() > 0;
        }

        #endregion
    }
}
