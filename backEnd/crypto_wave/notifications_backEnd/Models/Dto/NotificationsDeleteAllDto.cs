using System.ComponentModel.DataAnnotations;

namespace userNotifications.Models.Dto
{
    public class NotificationsDeleteAllDto
    {
        [Required]
        public int userId { get; set; }
    }
}
