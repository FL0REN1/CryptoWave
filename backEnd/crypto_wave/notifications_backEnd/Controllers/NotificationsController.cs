using AutoMapper;
using Azure;
using crypto_wave.Models.NotificationsModel;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using System.Buffers.Text;
using System.Collections.Generic;
using System.Reflection.Metadata;
using userNotifications.Models;
using userNotifications.Models.Dto;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

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
        /// [DELETE_CHOOSEN_NOTIFICATIONS]
        /// </summary>
        /// <param name="NotificationsDeleteDto"></param>
        /// <returns></returns>
        [HttpDelete("deleteChoosen", Name = "DeleteChoosenNotifications")]
        public ActionResult<NotificationsReadDto> DeleteChoosenNotifications(NotificationsDeleteChoosenDto notificationsDeleteChoosenDto)
        {
            string logMessage = $"--> Deleting all Notifications: {notificationsDeleteChoosenDto.userId}...";
            NotificationsRabbitMQ.NotificationsActionMQ.SendMessage(logMessage);

            Notifications NotificationsModel = _mapper.Map<Notifications>(notificationsDeleteChoosenDto);
            bool success = _repository.DeleteChoosenNotifications(NotificationsModel.UserId);
            if (!success) return NotFound();
            _repository.SaveChanges();

            NotificationsReadDto NotificationsReadDto = _mapper.Map<NotificationsReadDto>(NotificationsModel);

            string logMessage2 = $"--> Notifications deleted successfully ! [{NotificationsReadDto.Id}] : {NotificationsReadDto.Date}";
            NotificationsRabbitMQ.NotificationsActionMQ.SendMessage(logMessage2);

            return Ok(NotificationsReadDto);
        }

        /// <summary>
        /// [CHANGE_TO_READ_NOTIFICATION]
        /// </summary>
        /// <param name="NotificationsChangeDto"></param>
        /// <returns></returns>
        [HttpPut("changeToReadAllNotifications", Name = "ChangeToReadAllNotifications")]
        public ActionResult<NotificationsReadDto> ChangeToReadAllNotifications(NotificationsChangeToReadAllDto notificationsChangeToReadDto)
        {
            string logMessage = $"--> Changing all Notifications: {notificationsChangeToReadDto.UserId}...";
            NotificationsRabbitMQ.NotificationsActionMQ.SendMessage(logMessage);

            Notifications NotificationsModel = _mapper.Map<Notifications>(notificationsChangeToReadDto);
            bool success = _repository.ChangeToReadAllNotifications(notificationsChangeToReadDto.UserId);
            if (!success) return NotFound();
            _repository.SaveChanges();

            NotificationsReadDto NotificationsReadDto = _mapper.Map<NotificationsReadDto>(NotificationsModel);

            string logMessage2 = $"--> Notification changed successfully ! [{NotificationsReadDto.Id}] : {NotificationsReadDto.Date}";
            NotificationsRabbitMQ.NotificationsActionMQ.SendMessage(logMessage2);

            return Ok(NotificationsReadDto);
        }

        /// <summary>
        /// [CHANGE_TO_CHOOSEN_NOTIFICATION]
        /// </summary>
        /// <param name="NotificationsChangeDto"></param>
        /// <returns></returns>
        [HttpPut("changeToChoosenAllNotifications", Name = "ChangeToChoosenAllNotifications")]
        public ActionResult<NotificationsReadDto> ChangeToChoosenAllNotifications(NotificationsChangeToChoosenAllDto notificationsChangeToAllChoosenDto)
        {
            string logMessage = $"--> Changing all Notifications: {notificationsChangeToAllChoosenDto.UserId}...";
            NotificationsRabbitMQ.NotificationsActionMQ.SendMessage(logMessage);

            Notifications NotificationsModel = _mapper.Map<Notifications>(notificationsChangeToAllChoosenDto);
            bool success = _repository.ChangeToChoosenAllNotifications(notificationsChangeToAllChoosenDto.UserId);
            if (!success) return NotFound();
            _repository.SaveChanges();

            NotificationsReadDto NotificationsReadDto = _mapper.Map<NotificationsReadDto>(NotificationsModel);

            string logMessage2 = $"--> Notification changed successfully ! [{NotificationsReadDto.Id}] : {NotificationsReadDto.Date}";
            NotificationsRabbitMQ.NotificationsActionMQ.SendMessage(logMessage2);

            return Ok(NotificationsReadDto);
        }

        /// <summary>
        /// [CHANGE_TO_CHOOSEN_NOTIFICATION]
        /// </summary>
        /// <param name="NotificationsChangeDto"></param>
        /// <returns></returns>
        [HttpPut("changeToChoosenNotification", Name = "ChangeToChoosenNotification")]
        public ActionResult<NotificationsReadDto> ChangeToChoosenNotification(NotificationsChangeToChoosenDto notificationsChangeToChoosenDto)
        {
            string logMessage = $"--> Changing all Notifications: {notificationsChangeToChoosenDto.Id}...";
            NotificationsRabbitMQ.NotificationsActionMQ.SendMessage(logMessage);

            Notifications NotificationsModel = _mapper.Map<Notifications>(notificationsChangeToChoosenDto);
            bool success = _repository.ChangeToChoosenNotification(notificationsChangeToChoosenDto.Id);
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
