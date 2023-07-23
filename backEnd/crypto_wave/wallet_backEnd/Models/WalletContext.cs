using Microsoft.EntityFrameworkCore;

namespace user_wallet.Models
{
    public class WalletContext : DbContext
    {
        public WalletContext(DbContextOptions<WalletContext> options) : base(options) { }
        public DbSet<Wallet>? Wallet { get; set; }
    }
}
