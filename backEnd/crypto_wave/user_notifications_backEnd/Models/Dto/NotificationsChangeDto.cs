using System.ComponentModel.DataAnnotations;

namespace userNotifications.Models.Dto
{
    public class NotificationsChangeDto
    {
        [Required]
        public int UserId { get; set; }
    }
}
