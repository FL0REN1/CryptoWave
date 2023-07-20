using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using news_backend.Models;
using news_backend.Models.Dto;

namespace news_backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NewsController : ControllerBase
    {
        #region [DATA]

        private readonly INewsRep _repository;
        private readonly IMapper _mapper;

        #endregion

        /// <summary>
        /// [CONSTRUCTOR]
        /// </summary>
        /// <param name="repository"></param>
        /// <param name="mapper"></param>
        public NewsController(INewsRep repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }

        #region [WEB_API]

        /// <summary>
        /// [CREATE_NEWS]
        /// </summary>
        /// <param name="newsCreateDto"></param>
        /// <returns></returns>
        [HttpPost(Name = "CreateNews")]
        public ActionResult<NewsReadDto> CreateNews([FromBody] NewsCreateDto newsCreateDto)
        {
            string logMessage = $"--> News creation: {newsCreateDto.Date}...";
            NewsRabbitMQ.NewsActionMQ.SendMessage(logMessage);

            News newsModel = _mapper.Map<News>(newsCreateDto);
            bool success = _repository.CreateNews(newsModel);
            if (!success) return NotFound();
            _repository.SaveChanges();

            NewsReadDto newsReadDto = _mapper.Map<NewsReadDto>(newsModel);

            string logMessage2 = $"--> News created successfully ! [{newsReadDto.Id}] : {newsReadDto.Date}";
            NewsRabbitMQ.NewsActionMQ.SendMessage(logMessage2);

            return Ok(newsReadDto);
        }

        /// <summary>
        /// [DELETE_NEWS]
        /// </summary>
        /// <param name="newsDeleteDto"></param>
        /// <returns></returns>
        [HttpDelete(Name = "DeleteNews")]
        public ActionResult<NewsReadDto> DeleteNews([FromBody] NewsDeleteDto newsDeleteDto)
        {
            string logMessage = $"--> Deleting a news: {newsDeleteDto.Id}...";
            NewsRabbitMQ.NewsActionMQ.SendMessage(logMessage);

            News newsModel = _mapper.Map<News>(newsDeleteDto);
            bool success = _repository.DeleteNews(newsModel.Id);
            if (!success) return NotFound();
            _repository.SaveChanges();

            NewsReadDto newsReadDto = _mapper.Map<NewsReadDto>(newsModel);

            string logMessage2 = $"--> News deleted successfully ! [{newsReadDto.Id}] : {newsReadDto.Date}";
            NewsRabbitMQ.NewsActionMQ.SendMessage(logMessage2);

            return Ok(newsReadDto);
        }

        /// <summary>
        /// [CHANGE_NEWS]
        /// </summary>
        /// <param name="newsChangeDto"></param>
        /// <returns></returns>
        [HttpPut("change", Name = "ChangeNews")]
        public ActionResult<NewsReadDto> ChangeNews(NewsChangeDto newsChangeDto)
        {
            string logMessage = $"--> Changing a news: {newsChangeDto.Date}...";
            NewsRabbitMQ.NewsActionMQ.SendMessage(logMessage);

            News newsModel = _mapper.Map<News>(newsChangeDto);
            bool success = _repository.ChangeNews(newsModel, newsChangeDto.Id);
            if (!success) return NotFound();
            _repository.SaveChanges();

            NewsReadDto newsReadDto = _mapper.Map<NewsReadDto>(newsModel);

            string logMessage2 = $"--> News changed successfully ! [{newsReadDto.Id}] : {newsReadDto.Date}";
            NewsRabbitMQ.NewsActionMQ.SendMessage(logMessage2);

            return Ok(newsReadDto);
        }

        /// <summary>
        /// [GET_ALL_NEWS]
        /// </summary>
        /// <returns></returns>
        [HttpGet("all", Name = "GetAllNews")]
        public ActionResult<IEnumerable<NewsReadDto>> GetAllNews()
        {
            string logMessage = "--> Getting all news...";
            NewsRabbitMQ.NewsActionMQ.SendMessage(logMessage);

            var newsModel = _repository.GetAllNews();

            string logMessage2 = $"--> News received successfully !";
            NewsRabbitMQ.NewsActionMQ.SendMessage(logMessage2);

            return Ok(_mapper.Map<IEnumerable<NewsReadDto>>(newsModel));
        }

        #endregion
    }
}
