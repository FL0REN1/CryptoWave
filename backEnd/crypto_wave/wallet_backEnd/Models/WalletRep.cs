using user_wallet.Models.Dto;

namespace user_wallet.Models
{
    public class WalletRep : IWalletRep
    {
        #region [DATA]

        private readonly WalletContext _context;

        #endregion

        /// <summary>
        /// [USER_REP CONSTRUCTOR]
        /// </summary>
        /// <param name="context"></param>
        public WalletRep(WalletContext context)
        {
            _context = context;
        }

        #region [INTERFACE_IMPLEMENTION]

        /// <summary>
        /// [BUY/SELL]
        /// </summary>
        /// <param name="changeDto"></param>
        /// <returns></returns>
        public bool ChangeWallet(WalletChangeDto changeDto)
        {
            var currencyToBuy = _context.Wallet?.FirstOrDefault(w => w.CurrencyName == changeDto.CurrencyToBuy && w.UserId == changeDto.UserId);
            if (currencyToBuy == null)
            {
                currencyToBuy = new Wallet
                {
                    CurrencyName = changeDto.CurrencyToBuy,
                    UserId = changeDto.UserId,
                    CurrencyCount = 0
                };
                _context.Wallet?.Add(currencyToBuy);
            }

            var currencyToSell = _context.Wallet?.FirstOrDefault(w => w.CurrencyName == changeDto.CurrencyToSell && w.UserId == changeDto.UserId);
            if (currencyToSell == null)
            {
                currencyToSell = new Wallet
                {
                    CurrencyName = changeDto.CurrencyToSell,
                    UserId = changeDto.UserId,
                    CurrencyCount = 0
                };
                _context.Wallet?.Add(currencyToSell);
            }

            int totalCost = changeDto.CurrencyCount;
            if (currencyToSell.CurrencyCount < totalCost)
            {
                return false;
            }

            currencyToBuy.CurrencyCount += changeDto.CurrencyCount;
            currencyToSell.CurrencyCount -= changeDto.CurrencyCount;

            _context.SaveChanges();

            return true;
        }

        /// <summary>
        /// [CHANGE_FAVORITE_WALLET]
        /// </summary>
        /// <param name="changeFavoriteDto"></param>
        /// <returns></returns>
        public bool ChangeFavoriteWallet(WalletChangeFavoriteDto changeFavoriteDto)
        {
            Wallet? walletModel = _context.Wallet?.FirstOrDefault(m => m.UserId == changeFavoriteDto.UserId && m.Id == changeFavoriteDto.Id);
            if (walletModel == null)
            {
                string message = "[X] Failed to change wallet because it is empty";
                WalletRabbitMQ.WalletErrorMQ.SendMessage(message);
                return false;
            }
            walletModel.IsFavorite = !walletModel.IsFavorite;
            return true;
        }

        /// <summary>
            /// [CREATE_WALLET]
            /// </summary>
            /// <param name="wallet"></param>
            /// <returns></returns>
        public bool CreateWallet(Wallet wallet)
        {
          if (wallet == null)
          {
            string message = "[X] Failed to create wallet because it is empty";
             WalletRabbitMQ.WalletErrorMQ.SendMessage(message);
             return false;
          }

          _context.Wallet?.Add(wallet);
          return true;
        }


        /// <summary>
        /// [GET_ALL_NOTIFICATIONS]
        /// </summary>
        /// <param name="walletGetAll"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public IEnumerable<Wallet> GetAllWallet(WalletGetAll walletGetAll)
        {
            return _context.Wallet?.Where(n => n.UserId == walletGetAll.UserId).ToList() ?? Enumerable.Empty<Wallet>();
        }

        /// <summary>
        /// [GET_DETAILS_WALLET]
        /// </summary>
        /// <param name="walletGetDetails"></param>
        /// <returns></returns>
        public Wallet GetDetailsWallet(WalletGetDetails walletGetDetails)
        {
            return _context?.Wallet?.SingleOrDefault(n => n.UserId == walletGetDetails.UserId && n.CurrencyName == walletGetDetails.CurrencyName);
        }

        /// <summary>
        /// [SAVE_CHANGES]
        /// </summary>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public bool SaveChanges()
        {
            return _context.SaveChanges() > 0;
        }

        #endregion
    }
}
