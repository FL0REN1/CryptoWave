using System.ComponentModel.DataAnnotations;

namespace userNotifications.Models.Dto
{
    public class NotificationsReadDto
    {
        [Required]
        public int Id { get; set; }
        [Required]
        public string? Type { get; set; }
        [Required]
        public string? Text { get; set; }
        [Required]
        public string? Date { get; set; }
        [Required]
        public int UserId { get; set; }
        [Required]
        public bool IsRead { get; set; }
    }
}
