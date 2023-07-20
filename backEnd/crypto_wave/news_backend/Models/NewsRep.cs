namespace news_backend.Models
{
    public class NewsRep : INewsRep
    {
        #region [DATA]

        private readonly NewsContext _context;

        #endregion

        /// <summary>
        /// [NEWS_REP CONSTRUCTOR]
        /// </summary>
        /// <param name="context"></param>
        public NewsRep(NewsContext context)
        {
            _context = context;
        }

        #region [INTERFACE IMPLEMENTION]

        /// <summary>
        /// [CHANGE_NEWS]
        /// </summary>
        /// <param name="news"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public bool ChangeNews(News news, int id)
        {
            News? newsModel = _context.News?.FirstOrDefault(m => m.Id == id);
            if (newsModel == null)
            {
                string message = "[X] Failed to change news because it is empty";
                NewsRabbitMQ.NewsErrorMQ.SendMessage(message);
                return false;
            }
            newsModel.Text = news.Text;

            return true;
        }

        /// <summary>
        /// [CREATE_NEWS]
        /// </summary>
        /// <param name="news"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public bool CreateNews(News news)
        {
            if (news == null)
            {
                string message = "[X] Failed to create news because it is empty";
                NewsRabbitMQ.NewsErrorMQ.SendMessage(message);
                return false;
            }
            _context.News?.Add(news);
            return true;
        }

        /// <summary>
        /// [DELETE_NEWS]
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public bool DeleteNews(int id)
        {
            News? news = _context.News?.FirstOrDefault(m => m.Id == id);
            if (news == null)
            {
                string message = "[X] Failed to delete news because it is empty";
                NewsRabbitMQ.NewsErrorMQ.SendMessage(message);
                return false;
            }
            _context.News?.Remove(news);
            return true;
        }

        /// <summary>
        /// [GET_ALL_NEWS]
        /// </summary>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public IEnumerable<News> GetAllNews() => _context.News?.ToList() ?? Enumerable.Empty<News>();

        /// <summary>
        /// [SAVE_CHANGES]
        /// </summary>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public bool SaveChanges()
        {
            return _context.SaveChanges() > 0;
        }

        #endregion
    }
}
