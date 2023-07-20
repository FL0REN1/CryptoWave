using System.ComponentModel.DataAnnotations;

namespace userNotifications.Models.Dto
{
    public class NotificationDeleteDto
    {
        [Required]
        public int Id { get; set; }
    }
}
