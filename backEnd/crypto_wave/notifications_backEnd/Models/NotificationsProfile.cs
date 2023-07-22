using AutoMapper;
using userNotifications.Models.Dto;

namespace userNotifications.Models
{
    public class NotificationsProfile : Profile
    {
        public NotificationsProfile()
        {
            CreateMap<Notifications, NotificationsReadDto>();
            CreateMap<NotificationsCreateDto, Notifications>();
            CreateMap<NotificationsChangeAllDto, Notifications>();
            CreateMap<NotificationsChangeSingleDto, Notifications>();
            CreateMap<NotificationsDeleteDto, Notifications>();
            CreateMap<NotificationsDeleteAllDto, Notifications>();
        }
    }
}
