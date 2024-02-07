import 'package:flutter/material.dart';

import '../../../data/news_repository.dart';
import '../../../domain/news/inews.dart';

class HomeViewModel extends ChangeNotifier {
  final NewsRepository _newsRepository = NewsRepository();
  Future<List<INews>> fetchData() async {
    List<INews> newData = await _newsRepository.fetchData();
    return newData;
  }
}
