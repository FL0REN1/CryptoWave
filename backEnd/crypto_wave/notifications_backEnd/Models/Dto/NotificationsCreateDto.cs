using System.ComponentModel.DataAnnotations;

namespace userNotifications.Models.Dto
{
    public class NotificationsCreateDto
    {
        [Required]
        public string? Type { get; set; }
        [Required]
        public string? Text { get; set; }
        [Required]
        public string? Date { get; set; }
        [Required]
        public int UserId { get; set; }
    }
}
