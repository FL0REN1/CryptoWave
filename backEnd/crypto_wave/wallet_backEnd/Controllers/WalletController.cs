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
        /// <param name="userId"></param>
        /// <returns></returns>
        [HttpGet("all", Name = "GetAllWallet")]
        public ActionResult<IEnumerable<WalletReadDto>> GetWalletAll(int userId)
        {
            string logMessage = "--> Getting all users...";
            WalletRabbitMQ.WalletActionMQ.SendMessage(logMessage);

            var walletModel = _repository.GetAllWallet(userId);

            string logMessage2 = $"--> Users received successfully !";
            WalletRabbitMQ.WalletActionMQ.SendMessage(logMessage2);

            return Ok(_mapper.Map<IEnumerable<WalletReadDto>>(walletModel));
        }

        #endregion
    }
}
