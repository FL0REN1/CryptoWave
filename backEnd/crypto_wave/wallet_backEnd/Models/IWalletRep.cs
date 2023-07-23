using user_wallet.Models.Dto;

namespace user_wallet.Models
{
    public interface IWalletRep
    {
        bool SaveChanges();

        bool ChangeWallet(WalletChangeDto changeDto);
        bool CreateWallet(Wallet wallet);


        IEnumerable<Wallet> GetAllWallet(int userId);
    }
}
