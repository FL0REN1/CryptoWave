using System.ComponentModel.DataAnnotations;

namespace user_wallet.Models
{
    public class Wallet
    {
        [Key]
        [Required]
        public int Id { get; set; }
        [Required]
        public int CurrencyCount { get; set; }
        [Required]
        public string? CurrencyName { get; set; }
        [Required]
        public int UserId { get; set; }
        [Required]
        public bool IsFavorite { get; set; }
    }
}
