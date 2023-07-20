using System.ComponentModel.DataAnnotations;

namespace crypto_wave.Models.UserModel
{
    public class User
    {
        [Key]
        [Required]
        public int Id { get; set; }
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
