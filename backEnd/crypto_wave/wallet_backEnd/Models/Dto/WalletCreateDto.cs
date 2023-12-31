﻿using System.ComponentModel.DataAnnotations;

namespace user_wallet.Models.Dto
{
    public class WalletCreateDto
    {
        [Required]
        public double CurrencyCount { get; set; }
        [Required]
        public string? CurrencyName { get; set; }
        [Required]
        public int UserId { get; set; }
    }
}
