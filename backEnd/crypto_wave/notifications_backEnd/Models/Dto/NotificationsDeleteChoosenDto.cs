using System.ComponentModel.DataAnnotations;

namespace userNotifications.Models.Dto
{
    public class NotificationsDeleteChoosenDto
    {
        [Required]
        public int userId { get; set; }
    }
}
