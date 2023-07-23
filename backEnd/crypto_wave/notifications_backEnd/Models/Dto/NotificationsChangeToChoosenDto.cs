using System.ComponentModel.DataAnnotations;

namespace userNotifications.Models.Dto
{
    public class NotificationsChangeToChoosenDto
    {
        [Required]
        public int Id { get; set; }
    }
}
