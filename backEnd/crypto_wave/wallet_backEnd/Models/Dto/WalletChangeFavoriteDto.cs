﻿using System.ComponentModel.DataAnnotations;

namespace user_wallet.Models.Dto
{
    public class WalletChangeFavoriteDto
    {
        [Required]
        public int UserId { get; set; }
        [Required]
        public string? CurrencyName { get; set; }
    }
}
