using System.ComponentModel.DataAnnotations;

namespace user_wallet.Models.Dto
{
    public class WalletChangeDto
    {
        [Required]
        public int CurrencyCount { get; set; }

        [Required]
        public string? CurrencyToBuy { get; set; }

        [Required]
        public string? CurrencyToSell { get; set; }

        [Required]
        public int UserId { get; set; }
    }
}
