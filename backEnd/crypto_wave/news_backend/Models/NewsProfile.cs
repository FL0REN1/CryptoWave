using AutoMapper;
using news_backend.Models.Dto;

namespace news_backend.Models
{
    public class NewsProfile : Profile
    {
        public NewsProfile()
        {
            CreateMap<News, NewsReadDto>();
            CreateMap<NewsCreateDto, News>();
            CreateMap<NewsDeleteDto, News>();
            CreateMap<NewsChangeDto, News>();
        }
    }
}
