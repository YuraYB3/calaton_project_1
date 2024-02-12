import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/news/news_repository.dart';
import '../../../domain/local_storage/ilocal_storage.dart';
import '../../../domain/news/inews.dart';
import '../../../domain/news/inews_repository.dart';
import '../../routing/inavigation_util.dart';
import '../../routing/routes.dart';
import '../../services/local_storage/keys/keys.dart';
import '../../services/networking/inetwork_service.dart';

class HomeViewModel extends ChangeNotifier {
  final ILocalStorage _localStorage;
  // ignore: unused_field
  final INetworkService _networkService;
  final INewsRepository _newsRepository;

  HomeViewModel(
      {required ILocalStorage localStorage,
      required INetworkService networkService})
      : _localStorage = localStorage,
        _networkService = networkService,
        _newsRepository = NewsRepository(networkService: networkService);
  List<INews> _newsData = [];

  List<INews> get newsData => _newsData;
  void _deleteEmailAndPassword() {
    _localStorage.delete(keyEmail);
    _localStorage.delete(keyPassword);
  }

  Future<void> fetchData() async {
    List<INews> data = await _newsRepository.fetchData();
    _newsData = data;
    notifyListeners();
  }

  void onLogOutButtonPressed(BuildContext context) {
    final INavigationUtil navigationUtil =
        Provider.of<INavigationUtil>(context, listen: false);
    _deleteEmailAndPassword();
    navigationUtil.navigateTo(routeLogin, allowBackNavigation: false);
  }
}
