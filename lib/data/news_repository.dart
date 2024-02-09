import 'package:dio/dio.dart';

import '../domain/news/inews.dart';
import '../domain/news/inews_repository.dart';
import 'news_model.dart';

class NewsRepository implements INewsRepository {
  @override
  Future<List<INews>> fetchData() async {
    final Dio dio = Dio();
    var apiUrl =
        'https://newsapi.org/v2/everything?q=ukraine&apiKey=ba51d9335fd54282a85357a5de6d151a';
    List<NewsModel> newsList = [];
    try {
      var response = await dio.get(apiUrl);

      newsList = (response.data['articles'] as List)
          .map((json) => NewsModel.fromJson(json))
          .map((news) => NewsModel(
              author: news.author,
              title: news.title,
              description: news.description,
              imageUrl: news.imageUrl))
          .toList();
    } catch (error) {
      //
    }
    return newsList;
  }
}
