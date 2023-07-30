using user_wallet.Models.Dto;

namespace user_wallet.Models
{
    public interface IWalletRep
    {
        bool SaveChanges();

        bool BuyCrypto(WalletChangeDto changeDto);
        bool SellCrypto(WalletChangeDto changeDto);
        bool CreateWallet(Wallet wallet);
        bool ChangeFavoriteWallet(WalletChangeFavoriteDto wallet);

        IEnumerable<Wallet> GetAllWallet(WalletGetAll walletGetAll);
        Wallet GetDetailsWallet(WalletGetDetails walletGetDetails);
    }
}
