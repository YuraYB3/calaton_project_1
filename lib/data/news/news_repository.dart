import '../../app/services/networking/endpoints.dart';
import '../../app/services/networking/inetwork_service.dart';
import '../../domain/news/inews_repository.dart';
import 'news.dart';

class NewsRepository implements INewsRepository {
  final INetworkService _networkService;
  NewsRepository({required INetworkService networkService})
      : _networkService = networkService;
  @override
  Future<dynamic> fetchData() async {
    List<News> newsList = [];
    try {
      var response = await _networkService.get(fetchNewsEndpoint, 'ukraine');

      newsList = (response['articles'] as List)
          .map((json) => News.fromJson(json))
          .map((news) => News(
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
