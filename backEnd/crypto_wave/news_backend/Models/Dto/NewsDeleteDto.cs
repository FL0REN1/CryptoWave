using System.ComponentModel.DataAnnotations;

namespace news_backend.Models.Dto
{
    public class NewsDeleteDto
    {
        [Required]
        public int Id { get; set; }
    }
}
