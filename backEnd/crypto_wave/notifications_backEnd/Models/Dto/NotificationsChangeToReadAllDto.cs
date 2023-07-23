using System.ComponentModel.DataAnnotations;

namespace userNotifications.Models.Dto
{
    public class NotificationsChangeToReadAllDto
    {
        [Required]
        public int UserId { get; set; }
    }
}
