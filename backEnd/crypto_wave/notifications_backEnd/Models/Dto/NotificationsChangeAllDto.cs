using System.ComponentModel.DataAnnotations;

namespace userNotifications.Models.Dto
{
    public class NotificationsChangeAllDto
    {
        [Required]
        public int UserId { get; set; }
    }
}
