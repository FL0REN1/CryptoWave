namespace news_backend.Models
{
    public interface INewsRep
    {
        bool SaveChanges();

        bool CreateNews(News news);
        bool DeleteNews(int id);
        bool ChangeNews(News news, int id);

        IEnumerable<News> GetAllNews();
    }
}
