using System.ComponentModel.DataAnnotations;

namespace news_backend.Models.Dto
{
    public class NewsCreateDto
    {
        [Required]
        public string? Text { get; set; }
        [Required]
        public string? Date { get; set; }
    }
}
