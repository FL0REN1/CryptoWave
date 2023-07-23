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
             CreateMap<WalletCreateDto, Wallet>();
        }
    }
}
