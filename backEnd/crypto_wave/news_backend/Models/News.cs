using System.ComponentModel.DataAnnotations;

namespace news_backend.Models
{
    public class News
    {
        [Key]
        [Required]
        public int Id { get; set; }
        [Required]
        public string? Text { get; set; }
        [Required]
        public string? Date { get; set; }
    }
}
