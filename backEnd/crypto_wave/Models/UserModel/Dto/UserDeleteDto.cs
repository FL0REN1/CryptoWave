using System.ComponentModel.DataAnnotations;

namespace crypto_wave.Models.UserModel.Dto
{
    public class UserDeleteDto
    {
        [Required]
        public int Id { get; set; }
    }
}
