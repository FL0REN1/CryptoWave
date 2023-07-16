using crypto_wave.Models.UserModel.Dto;

namespace crypto_wave.Models.UserModel
{
    public interface IUserRep
    {
        bool SaveChanges();

        bool CreateUser(User user);
        bool DeleteUser(int id);
        bool ChangeUser(User user, int id);

        IEnumerable<User> GetAllUsers();

        User? GetUserByLoginAndPassword(UserLoginDto userLoginDto);
        User? GetUserById(int id);
    }
}
