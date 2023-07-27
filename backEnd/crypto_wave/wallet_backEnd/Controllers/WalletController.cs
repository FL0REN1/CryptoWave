using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using user_wallet.Models;
using user_wallet.Models.Dto;

namespace user_wallet.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class WalletController : ControllerBase
    {
        #region [DATA]

        private readonly IWalletRep _repository;
        private readonly IMapper _mapper;

        #endregion

        /// <summary>
        /// [CONSTRUCTOR]
        /// </summary>
        /// <param name="repository"></param>
        /// <param name="mapper"></param>
        public WalletController(IWalletRep repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }

        #region [WEB_API]

        /// <summary>
        /// [WALLET_CHANGE]
        /// </summary>
        /// <param name="walletChangeDto"></param>
        /// <returns></returns>
        [HttpPost("change",Name = "WalletChange")]
        public ActionResult<WalletReadDto> WalletChange([FromBody] WalletChangeDto walletChangeDto)
        {
            string logMessage = $"--> Wallet changed: {walletChangeDto.UserId}...";
            WalletRabbitMQ.WalletActionMQ.SendMessage(logMessage);

            bool success = _repository.ChangeWallet(walletChangeDto);
            if (!success) return NotFound();
            _repository.SaveChanges();

            string logMessage2 = $"--> Wallet changed successfully !";
            WalletRabbitMQ.WalletActionMQ.SendMessage(logMessage2);

            return Ok();
        }

        /// <summary>
        /// [WALLET_FAVORITE_CHANGE]
        /// </summary>
        /// <param name="walletChangeFavoriteDto"></param>
        /// <returns></returns>
        [HttpPost("changeFavorite", Name = "WalletFavoriteChange")]
        public ActionResult<WalletReadDto> WalletFavoriteChange([FromBody] WalletChangeFavoriteDto walletChangeFavoriteDto)
        {
            string logMessage = $"--> Wallet changed: {walletChangeFavoriteDto.UserId}...";
            WalletRabbitMQ.WalletActionMQ.SendMessage(logMessage);

            bool success = _repository.ChangeFavoriteWallet(walletChangeFavoriteDto);
            if (!success) return NotFound();
            _repository.SaveChanges();

            string logMessage2 = $"--> Wallet changed successfully !";
            WalletRabbitMQ.WalletActionMQ.SendMessage(logMessage2);

            return Ok();
        }

        /// <summary>
        /// [WALLET_CREATE]
        /// </summary>
        /// <param name="walletCreateDto"></param>
        /// <returns></returns>
        [HttpPost("create", Name = "WalletCreate")]
        public ActionResult<WalletReadDto> WalletCreate([FromBody] WalletCreateDto walletCreateDto)
        {
            string logMessage = $"--> Wallet creation: {walletCreateDto.UserId}...";
            WalletRabbitMQ.WalletActionMQ.SendMessage(logMessage);

            Wallet walletModel = _mapper.Map<Wallet>(walletCreateDto);
            bool success = _repository.CreateWallet(walletModel);
            if (!success) return NotFound();
            _repository.SaveChanges();

            WalletReadDto userReadDto = _mapper.Map<WalletReadDto>(walletModel);

            string logMessage2 = $"--> Wallet created successfully ! [{userReadDto.Id}] : {userReadDto.UserId}";
            WalletRabbitMQ.WalletActionMQ.SendMessage(logMessage2);

            return Ok(userReadDto);
        }


        /// <summary>
        /// [GET_WALLET_ALL]
        /// </summary>
        /// <param name="walletGetAll"></param>
        /// <returns></returns>
        [HttpGet("all", Name = "GetAllWallet")]
        public ActionResult<IEnumerable<WalletReadDto>> GetWalletAll([FromBody] WalletGetAll walletGetAll)
        {
            string logMessage = "--> Getting all wallets...";
            WalletRabbitMQ.WalletActionMQ.SendMessage(logMessage);

            var walletModel = _repository.GetAllWallet(walletGetAll);

            string logMessage2 = $"--> Wallets received successfully !";
            WalletRabbitMQ.WalletActionMQ.SendMessage(logMessage2);

            return Ok(_mapper.Map<IEnumerable<WalletReadDto>>(walletModel));
        }

        /// <summary>
        /// [GET_DETAILS_WALLET]
        /// </summary>
        /// <param name="walletGetDetails"></param>
        /// <returns></returns>
        [HttpGet("details", Name = "GetDetailsWallet")]
        public ActionResult<WalletReadDto> GetDetailsWallet([FromBody] WalletGetDetails walletGetDetails)
        {
            string logMessage = "--> Getting wallet details...";
            WalletRabbitMQ.WalletActionMQ.SendMessage(logMessage);

            var walletModel = _repository.GetDetailsWallet(walletGetDetails);

            string logMessage2 = $"--> Wallet received successfully !";
            WalletRabbitMQ.WalletActionMQ.SendMessage(logMessage2);

            return Ok(_mapper.Map<WalletReadDto>(walletModel));
        }

        #endregion
    }
}
