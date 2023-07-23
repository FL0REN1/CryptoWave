using System.ComponentModel.DataAnnotations;

namespace userNotifications.Models.Dto
{
    public class NotificationsChangeToChoosenAllDto
    {
        [Required]
        public int UserId { get; set; }
    }
}
