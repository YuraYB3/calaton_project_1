import 'package:dio/dio.dart';

import 'inetwork_service.dart';

class NetworkService implements INetworkService {
  final String apiKey = "ba51d9335fd54282a85357a5de6d151a";
  final Dio dio = Dio();
  NetworkService() {
    init();
  }

  @override
  void init() {
    dio.options.baseUrl = 'https://newsapi.org/v2/';
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  @override
  Future get(String endpoint, String query) async {
    var response = await dio.get('$endpoint$query&apiKey=$apiKey');
    return response;
  }
}
