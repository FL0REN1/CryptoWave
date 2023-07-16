using crypto_wave.Models.UserModel.Dto;
using Microsoft.EntityFrameworkCore;

namespace crypto_wave.Models.UserModel
{
    public class UserRep : IUserRep
    {
        #region [DATA]

        private readonly UserContext _context;
        private readonly IWebHostEnvironment _env;

        #endregion

        /// <summary>
        /// [USER_REP CONSTRUCTOR]
        /// </summary>
        /// <param name="context"></param>
        public UserRep(UserContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }

        #region [INTERFACE IMPLEMENTION]

        /// <summary>
        /// [CHANGE_USER]
        /// </summary>
        /// <param name="user"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool ChangeUser(User user, int id)
        {
            User? userModel = _context.Users.FirstOrDefault(m => m.Id == id);
            if (userModel == null)
            {
                string message = "[X] Failed to change user because it is empty";
                UserRabbitMQ.UserErrorMQ.SendMessage(message);
                return false;
            }
            userModel.FullName = user.FullName;
            userModel.Email = user.Email;
            userModel.Password = user.Password;
            userModel.IsVerifiedMail = user.IsVerifiedMail;
            userModel.IsVerifiedUser = user.IsVerifiedUser;

            return true;
        }

        /// <summary>
        /// [CREATE_USER]
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public bool CreateUser(User user)
        {
            if (user == null)
            {
                string message = "[X] Failed to create user because it is empty";
                UserRabbitMQ.UserErrorMQ.SendMessage(message);
                return false;
            }
            _context.Users.Add(user);
            return true;
        }

        /// <summary>
        /// [DELETE_USER]
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool DeleteUser(int id)
        {
            User? user = _context.Users.FirstOrDefault(m => m.Id == id);
            if (user == null)
            {
                string message = "[X] Failed to delete user because it is empty";
                UserRabbitMQ.UserErrorMQ.SendMessage(message);
                return false;
            }
            _context.Users.Remove(user);
            return true;
        }

        /// <summary>
        /// [GET_ALL_USERS]
        /// </summary>
        /// <returns></returns>
        public IEnumerable<User> GetAllUsers()
        {
            return _context.Users.ToList();
        }

        /// <summary>
        /// [GET_USER_BY_ID]
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public User? GetUserById(int id)
        {
            User? IdUser = _context.Users.FirstOrDefault(x => x.Id == id);
            if (IdUser == null)
            {
                string message = $"[X] DB: [User], has no ID: [{id}]";
                UserRabbitMQ.UserErrorMQ.SendMessage(message);
                return null;
            }
            return IdUser;
        }

        /// <summary>
        /// [GET_USER_BY_LOGIN_AND_PASSWORD]
        /// </summary>
        /// <param name="userLoginDto"></param>
        /// <returns></returns>
        public User? GetUserByLoginAndPassword(UserLoginDto userLoginDto)
        {
            User? user = _context.Users.FirstOrDefault(i => i.Email == userLoginDto.Email && i.Password == userLoginDto.Password);
            if (user == null)
            {
                string message = $"[X] Failed to found user login: [{userLoginDto.Email}], and password: [{userLoginDto.Password}]";
                UserRabbitMQ.UserErrorMQ.SendMessage(message);
                return null;
            }
            return user;
        }

        /// <summary>
        /// [SAVE_CHANGES]
        /// </summary>
        /// <returns></returns>
        public bool SaveChanges()
        {
            return _context.SaveChanges() > 0;
        }

        #endregion
    }
}
