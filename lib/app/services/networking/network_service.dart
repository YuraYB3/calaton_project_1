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
    try {
      var response = await dio.get('$endpoint$query&apiKey=$apiKey');
      if (response.statusCode == 200) {
        return response.data;
      }
      throw 'Something went wrong';
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future delete(String endpoint, dynamic data) async {
    try {
      final Response response = await dio.delete(
        endpoint,
        data: data,
      );
      if (response.statusCode == 204) {
        return response.data;
      }
      throw "something went wrong";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future post(String endpoint, dynamic data) async {
    try {
      final Response response = await dio.post(
        endpoint,
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
      throw "something went wrong";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future put(String endpoint, dynamic data) async {
    try {
      final Response response = await dio.put(
        endpoint,
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
      throw "something went wrong";
    } catch (e) {
      rethrow;
    }
  }
}
