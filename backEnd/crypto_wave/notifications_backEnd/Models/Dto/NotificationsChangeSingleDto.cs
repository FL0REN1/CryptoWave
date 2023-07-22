using System.ComponentModel.DataAnnotations;

namespace userNotifications.Models.Dto
{
    public class NotificationsChangeSingleDto
    {
        [Required]
        public int Id { get; set; }
    }
}
