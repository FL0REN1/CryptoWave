using System.ComponentModel.DataAnnotations;

namespace userNotifications.Models.Dto
{
    public class NotificationsDeleteDto
    {
        [Required]
        public int Id { get; set; }
    }
}
