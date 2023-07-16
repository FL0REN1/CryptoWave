using AutoMapper;
using crypto_wave.Models.UserModel.Dto;

namespace crypto_wave.Models.UserModel
{
    public class UserProfile : Profile
    {
        public UserProfile()
        {
            CreateMap<User, UserReadDto>();
            CreateMap<UserCreateDto, User>();
            CreateMap<UserDeleteDto, User>();
            CreateMap<UserChangeDto, User>();
            CreateMap<UserLoginDto, User>();
        }
    }
}
