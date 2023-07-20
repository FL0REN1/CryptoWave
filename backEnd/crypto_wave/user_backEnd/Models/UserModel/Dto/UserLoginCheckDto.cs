using System.ComponentModel.DataAnnotations;

namespace crypto_wave.Models.UserModel.Dto
{
    public class UserLoginCheckDto
    {
        [Required]
        public string? Email { get; set; }
    }
}
