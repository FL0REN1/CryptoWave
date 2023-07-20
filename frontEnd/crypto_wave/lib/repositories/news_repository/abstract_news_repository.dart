import 'package:crypto_wave/repositories/news_repository/models/models.dart';

abstract class AbstractNewsRepository {
  Future<List<NewsRead>> getAllNews();
  Future<NewsRead> createNews(NewsCreate newsCreate);
  Future<NewsRead> deleteNews(NewsDelete newsDelete);
  Future<NewsRead> changeNews(NewsChange newsChange);
}
