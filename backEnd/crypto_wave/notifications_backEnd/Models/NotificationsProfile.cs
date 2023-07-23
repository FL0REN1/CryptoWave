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
            CreateMap<NotificationsChangeToReadAllDto, Notifications>();
            CreateMap<NotificationsChangeToChoosenAllDto, Notifications>();
            CreateMap<NotificationsChangeToChoosenDto, Notifications>();
            CreateMap<NotificationsDeleteDto, Notifications>();
            CreateMap<NotificationsDeleteAllDto, Notifications>();
            CreateMap<NotificationsDeleteChoosenDto, Notifications>();
        }
    }
}
