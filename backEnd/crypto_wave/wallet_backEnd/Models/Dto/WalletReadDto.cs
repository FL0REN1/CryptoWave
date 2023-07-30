using System.ComponentModel.DataAnnotations;

namespace user_wallet.Models.Dto
{
    public class WalletReadDto
    {
        [Required]
        public int Id { get; set; }
        [Required]
        public double CurrencyCount { get; set; }
        [Required]
        public string? CurrencyName { get; set; }
        [Required]
        public int UserId { get; set; }
        [Required]
        public bool IsFavorite { get; set; }
    }
}
