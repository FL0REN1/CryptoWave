using user_wallet.Models.Dto;

namespace user_wallet.Models
{
    public interface IWalletRep
    {
        bool SaveChanges();

        bool ChangeWallet(WalletChangeDto changeDto);
        bool CreateWallet(Wallet wallet);
        bool ChangeFavoriteWallet(WalletChangeFavoriteDto wallet);

        IEnumerable<Wallet> GetAllWallet(WalletGetAll walletGetAll);
        Wallet GetDetailsWallet(WalletGetDetails walletGetDetails);
    }
}
