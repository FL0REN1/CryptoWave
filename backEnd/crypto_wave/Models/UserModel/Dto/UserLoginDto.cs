using System.ComponentModel.DataAnnotations;

namespace crypto_wave.Models.UserModel.Dto
{
    public class UserLoginDto
    {
        [Required]
        public string? Email { get; set; }
        [Required]
        public string? Password { get; set; }
    }
}
