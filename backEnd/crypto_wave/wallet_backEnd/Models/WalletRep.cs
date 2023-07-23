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
        /// <param name="userId"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public IEnumerable<Wallet> GetAllWallet(int userId)
        {
            return _context.Wallet?.Where(n => n.UserId == userId).ToList() ?? Enumerable.Empty<Wallet>();
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
