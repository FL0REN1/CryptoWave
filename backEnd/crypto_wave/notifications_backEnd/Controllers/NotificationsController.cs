using AutoMapper;
using crypto_wave.Models.NotificationsModel;
using Microsoft.AspNetCore.Mvc;
using userNotifications.Models;
using userNotifications.Models.Dto;

namespace userNotifications.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NotificationsController : ControllerBase
    {
        #region [DATA]

        private readonly INotificationsRep _repository;
        private readonly IMapper _mapper;

        #endregion

        /// <summary>
        /// [CONSTRUCTOR]
        /// </summary>
        /// <param name="repository"></param>
        /// <param name="mapper"></param>
        public NotificationsController(INotificationsRep repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }

        #region [WEB_API]

        /// <summary>
        /// [CREATE_NOTIFICATION]
        /// </summary>
        /// <param name="NotificationsCreateDto"></param>
        /// <returns></returns>
        [HttpPost(Name = "CreateNotification")]
        public ActionResult<NotificationsReadDto> CreateNotification([FromBody] NotificationsCreateDto NotificationsCreateDto)
        {
            string logMessage = $"--> Notification creation: {NotificationsCreateDto.Date}...";
            NotificationsRabbitMQ.NotificationsActionMQ.SendMessage(logMessage);

            Notifications NotificationsModel = _mapper.Map<Notifications>(NotificationsCreateDto);
            bool success = _repository.CreateNotification(NotificationsModel);
            if (!success) return NotFound();
            _repository.SaveChanges();

            NotificationsReadDto NotificationsReadDto = _mapper.Map<NotificationsReadDto>(NotificationsModel);

            string logMessage2 = $"--> Notification created successfully ! [{NotificationsReadDto.Id}] : {NotificationsCreateDto.Date}";
            NotificationsRabbitMQ.NotificationsActionMQ.SendMessage(logMessage2);

            return Ok(NotificationsReadDto);
        }

        /// <summary>
        /// [DELETE_NOTIFICATIONS]
        /// </summary>
        /// <param name="NotificationsDeleteDto"></param>
        /// <returns></returns>
        [HttpDelete("delete",Name = "DeleteNotification")]
        public ActionResult<NotificationsReadDto> DeleteNotification(NotificationsDeleteDto notificationsDeleteDto)
        {
            string logMessage = $"--> Deleting a Notification: {notificationsDeleteDto.Id}...";
            NotificationsRabbitMQ.NotificationsActionMQ.SendMessage(logMessage);

            Notifications NotificationsModel = _mapper.Map<Notifications>(notificationsDeleteDto);
            bool success = _repository.DeleteNotification(NotificationsModel.Id);
            if (!success) return NotFound();
            _repository.SaveChanges();

            NotificationsReadDto NotificationsReadDto = _mapper.Map<NotificationsReadDto>(NotificationsModel);

            string logMessage2 = $"--> Notification deleted successfully ! [{NotificationsReadDto.Id}] : {NotificationsReadDto.Date}";
            NotificationsRabbitMQ.NotificationsActionMQ.SendMessage(logMessage2);

            return Ok(NotificationsReadDto);
        }

        /// <summary>
        /// [DELETE_ALL_NOTIFICATIONS]
        /// </summary>
        /// <param name="NotificationsDeleteDto"></param>
        /// <returns></returns>
        [HttpDelete("deleteAll", Name = "DeleteAllNotifications")]
        public ActionResult<NotificationsReadDto> DeleteAllNotifications(NotificationsDeleteAllDto notificationsDeleteAllDto)
        {
            string logMessage = $"--> Deleting all Notifications: {notificationsDeleteAllDto.userId}...";
            NotificationsRabbitMQ.NotificationsActionMQ.SendMessage(logMessage);

            Notifications NotificationsModel = _mapper.Map<Notifications>(notificationsDeleteAllDto);
            bool success = _repository.DeleteAllNotifications(NotificationsModel.UserId);
            if (!success) return NotFound();
            _repository.SaveChanges();

            NotificationsReadDto NotificationsReadDto = _mapper.Map<NotificationsReadDto>(NotificationsModel);

            string logMessage2 = $"--> Notifications deleted successfully ! [{NotificationsReadDto.Id}] : {NotificationsReadDto.Date}";
            NotificationsRabbitMQ.NotificationsActionMQ.SendMessage(logMessage2);

            return Ok(NotificationsReadDto);
        }

        /// <summary>
        /// [CHANGE_NOTIFICATIONS]
        /// </summary>
        /// <param name="NotificationsChangeDto"></param>
        /// <returns></returns>
        [HttpPut("change", Name = "ChangeNotification")]
        public ActionResult<NotificationsReadDto> ChangeNotification(NotificationsChangeDto NotificationsChangeDto)
        {
            string logMessage = $"--> Changing all Notifications: {NotificationsChangeDto.UserId}...";
            NotificationsRabbitMQ.NotificationsActionMQ.SendMessage(logMessage);

            Notifications NotificationsModel = _mapper.Map<Notifications>(NotificationsChangeDto);
            bool success = _repository.ChangeAllNotifications(NotificationsChangeDto.UserId);
            if (!success) return NotFound();
            _repository.SaveChanges();

            NotificationsReadDto NotificationsReadDto = _mapper.Map<NotificationsReadDto>(NotificationsModel);

            string logMessage2 = $"--> Notification changed successfully ! [{NotificationsReadDto.Id}] : {NotificationsReadDto.Date}";
            NotificationsRabbitMQ.NotificationsActionMQ.SendMessage(logMessage2);

            return Ok(NotificationsReadDto);
        }

        /// <summary>
        /// [GET_ALL_NOTIFICATIONS]
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        [HttpGet("all", Name = "GetAllNotifications")]
        public ActionResult<IEnumerable<NotificationsReadDto>> GetAllNotifications(int userId)
        {
            string logMessage = "--> Getting all Notifications...";
            NotificationsRabbitMQ.NotificationsActionMQ.SendMessage(logMessage);

            var NotificationsModel = _repository.GetAllNotifications(userId);

            string logMessage2 = $"--> Notificationss received successfully !";
            NotificationsRabbitMQ.NotificationsActionMQ.SendMessage(logMessage2);

            return Ok(_mapper.Map<IEnumerable<NotificationsReadDto>>(NotificationsModel));
        }


        /// <summary>
        /// [GET_UN_READ_NOTIFICATIONS]
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        [HttpGet("UnRead", Name = "GetUnReadNotifications")]
        public ActionResult<IEnumerable<NotificationsReadDto>> GetUnReadNotifications(int userId)
        {
            string logMessage = "--> Getting Un Read Notifications...";
            NotificationsRabbitMQ.NotificationsActionMQ.SendMessage(logMessage);

            var NotificationsModel = _repository.GetUnReadNotifications(userId);

            string logMessage2 = $"--> Notificationss received successfully !";
            NotificationsRabbitMQ.NotificationsActionMQ.SendMessage(logMessage2);

            return Ok(_mapper.Map<IEnumerable<NotificationsReadDto>>(NotificationsModel));
        }

        #endregion
    }
}
