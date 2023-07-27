using System.ComponentModel.DataAnnotations;

namespace user_wallet.Models.Dto
{
    public class WalletGetAll
    {
        [Required]
        public int UserId { get; set; }
    }
}
