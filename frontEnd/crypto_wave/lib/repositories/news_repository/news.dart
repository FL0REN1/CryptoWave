import 'package:crypto_wave/repositories/news_repository/models/models.dart';
import 'package:crypto_wave/repositories/news_repository/news_repository.dart';
import 'package:dio/dio.dart';

class News implements AbstractNewsRepository {
  final Dio dio;

  News({required this.dio});

  @override
  Future<NewsRead> changeNews(NewsChange newsChange) async {
    final Response response =
        await dio.put('http://10.0.2.2:5052/api/News/change', data: newsChange);
    final dynamic newsResponse = response.data;
    final NewsRead news = newsResponse.map((json) => NewsRead.fromJson(json));
    return news;
  }

  @override
  Future<NewsRead> createNews(NewsCreate newsCreate) async {
    final Response response = await dio.post(
      'http://10.0.2.2:5052/api/News',
      data: newsCreate.toJson(),
    );
    final dynamic newsResponse = response.data;
    final NewsRead news = NewsRead.fromJson(newsResponse);
    return news;
  }

  @override
  Future<NewsRead> deleteNews(NewsDelete newsDelete) async {
    final Response response =
        await dio.delete('http://10.0.2.2:5052/api/News', data: newsDelete);
    final dynamic userResponse = response.data;
    final NewsRead user = userResponse.map((json) => NewsRead.fromJson(json));
    return user;
  }

  @override
  Future<List<NewsRead>> getAllNews() async {
    final Response response = await dio.get(
      'http://10.0.2.2:5052/api/News/all',
    );
    final List<dynamic> newsResponse = response.data;
    final List<NewsRead> news =
        newsResponse.map((json) => NewsRead.fromJson(json)).toList();
    return news;
  }
}
