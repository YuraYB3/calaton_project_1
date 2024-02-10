import 'package:flutter/material.dart';

import '../../../data/news_repository.dart';
import '../../../domain/news/inews.dart';

class HomeViewModel extends ChangeNotifier {
  final NewsRepository _newsRepository = NewsRepository();
  List<INews> _newsData = [];

  List<INews> get newsData => _newsData;

  Future<void> fetchData() async {
    List<INews> data = await _newsRepository.fetchData();
    _newsData = data;
    notifyListeners();
  }
}
