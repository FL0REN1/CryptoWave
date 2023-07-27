using System.ComponentModel.DataAnnotations;

namespace user_wallet.Models.Dto
{
    public class WalletGetDetails
    {
        [Required]
        public int UserId { get; set; }
        [Required]
        public string? CurrencyName { get; set; }
    }
}
