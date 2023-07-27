using AutoMapper;
using user_wallet.Models.Dto;

namespace user_wallet.Models
{
    public class WalletProfile : Profile
    {
         public WalletProfile()
         {
             CreateMap<Wallet, WalletReadDto>();
             CreateMap<WalletChangeDto, Wallet>();
             CreateMap<WalletChangeFavoriteDto, Wallet>();
             CreateMap<WalletCreateDto, Wallet>();
             CreateMap<WalletGetAll, Wallet>();
             CreateMap<WalletGetDetails, Wallet>();
         }
    }
}
