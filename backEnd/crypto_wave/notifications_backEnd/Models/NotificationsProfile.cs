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
            CreateMap<NotificationsChangeDto, Notifications>();
            CreateMap<NotificationDeleteDto, Notifications>();
            CreateMap<NotificationsDeleteAllDto, Notifications>();
        }
    }
}
