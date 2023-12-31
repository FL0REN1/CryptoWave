﻿using AutoMapper;
using crypto_wave.Models.UserModel;
using crypto_wave.Models.UserModel.Dto;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace crypto_wave.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        #region [DATA]

        private readonly IUserRep _repository;
        private readonly IMapper _mapper;

        #endregion

        /// <summary>
        /// [CONSTRUCTOR]
        /// </summary>
        /// <param name="repository"></param>
        /// <param name="mapper"></param>
        public UserController(IUserRep repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }

        #region [WEB_API]

        /// <summary>
        /// [CREATE_USER]
        /// </summary>
        /// <param name="userCreateDto"></param>
        /// <returns></returns>
        [HttpPost(Name = "CreateUser")]
        public ActionResult<UserReadDto> CreateUser([FromBody] UserCreateDto userCreateDto)
        {
            string logMessage = $"--> User creation: {userCreateDto.Email}...";
            UserRabbitMQ.UserActionMQ.SendMessage(logMessage);

            User userModel = _mapper.Map<User>(userCreateDto);
            bool success = _repository.CreateUser(userModel);
            if (!success) return NotFound();
            _repository.SaveChanges();

            UserReadDto userReadDto = _mapper.Map<UserReadDto>(userModel);

            string logMessage2 = $"--> User created successfully ! [{userReadDto.Id}] : {userReadDto.Email}";
            UserRabbitMQ.UserActionMQ.SendMessage(logMessage2);

            return Ok(userReadDto);
        }

        /// <summary>
        /// [DELETE_USER]
        /// </summary>
        /// <param name="userDeleteDto"></param>
        /// <returns></returns>
        [HttpDelete(Name = "DeleteUser")]
        public ActionResult<UserReadDto> DeleteUser([FromBody] UserDeleteDto userDeleteDto)
        {
            string logMessage = $"--> Deleting a user: {userDeleteDto.Id}...";
            UserRabbitMQ.UserActionMQ.SendMessage(logMessage);

            User userModel = _mapper.Map<User>(userDeleteDto);
            bool success = _repository.DeleteUser(userModel.Id);
            if (!success) return NotFound();
            _repository.SaveChanges();

            UserReadDto userReadDto = _mapper.Map<UserReadDto>(userModel);

            string logMessage2 = $"--> User deleted successfully ! [{userReadDto.Id}] : {userReadDto.Email}";
            UserRabbitMQ.UserActionMQ.SendMessage(logMessage2);

            return Ok(userReadDto);
        }

        /// <summary>
        /// [CHANGE_USER]
        /// </summary>
        /// <param name="userChangeDto"></param>
        /// <returns></returns>
        [HttpPut("change", Name = "ChangeUser")]
        public ActionResult<UserReadDto> ChangeUser(UserChangeDto userChangeDto)
        {
            string logMessage = $"--> Changing a user: {userChangeDto.Email}...";
            UserRabbitMQ.UserActionMQ.SendMessage(logMessage);

            User userModel = _mapper.Map<User>(userChangeDto);
            bool success = _repository.ChangeUser(userModel, userChangeDto.Id);
            if (!success) return NotFound();
            _repository.SaveChanges();

            UserReadDto userReadDto = _mapper.Map<UserReadDto>(userModel);

            string logMessage2 = $"--> User changed successfully ! [{userReadDto.Id}] : {userReadDto.Email}";
            UserRabbitMQ.UserActionMQ.SendMessage(logMessage2);

            return Ok(userReadDto);
        }

        /// <summary>
        /// [GET_ALL_USERS]
        /// </summary>
        /// <returns></returns>
        [HttpGet("all", Name = "GetAllUsers")]
        public ActionResult<IEnumerable<UserReadDto>> GetAllUsers()
        {
            string logMessage = "--> Getting all users...";
            UserRabbitMQ.UserActionMQ.SendMessage(logMessage);

            var userModel = _repository.GetAllUsers();

            string logMessage2 = $"--> Users received successfully !";
            UserRabbitMQ.UserActionMQ.SendMessage(logMessage2);

            return Ok(_mapper.Map<IEnumerable<UserReadDto>>(userModel));
        }

        /// <summary>
        /// [GET_USER_BY_ID]
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("id", Name = "GetUserById")]
        public ActionResult<UserReadDto> GetUserById(int id)
        {
            string logMessage = $"--> Getting user N: [{id}]...";
            UserRabbitMQ.UserActionMQ.SendMessage(logMessage);

            var userModel = _repository.GetUserById(id);
            if (userModel == null) return NotFound();

            string logMessage2 = $"--> User N: [{id}] successfully received !";
            UserRabbitMQ.UserActionMQ.SendMessage(logMessage2);

            return Ok(_mapper.Map<UserReadDto>(userModel));
        }

        /// <summary>
        /// [CHECK_LOGIN]
        /// </summary>
        /// <param name="userLoginDto"></param>
        /// <returns></returns>
        [HttpPost("login")]
        public ActionResult<UserReadDto> CheckLogin([FromBody] UserLoginDto userLoginDto)
        {
            string logMessage = $"--> Getting user by login and password...";
            UserRabbitMQ.UserActionMQ.SendMessage(logMessage);

            var userModel = _repository.GetUserByLoginAndPassword(userLoginDto);
            if (userModel == null) return NotFound();

            string logMessage2 = $"--> User by login and password received successfully !";
            UserRabbitMQ.UserActionMQ.SendMessage(logMessage2);

            return Ok(_mapper.Map<UserReadDto>(userModel));
        }

        #endregion
    }
}
