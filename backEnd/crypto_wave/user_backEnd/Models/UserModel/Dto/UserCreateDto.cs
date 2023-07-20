using System.ComponentModel.DataAnnotations;

namespace crypto_wave.Models.UserModel.Dto
{
    public class UserCreateDto
    {
        [Required]
        public string? FullName { get; set; }
        [Required]
        public string? Email { get; set; }
        [Required]
        public string? Password { get; set; }
        [Required]
        public bool IsVerifiedMail { get; set; }
        [Required]
        public bool IsVerifiedUser { get; set; }
    }
}
