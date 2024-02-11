import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/news/news_repository.dart';
import '../../../domain/local_storage/ilocal_storage.dart';
import '../../../domain/news/inews.dart';
import '../../common/login_variables.dart';
import '../../routing/inavigation_util.dart';
import '../../routing/routes.dart';

class HomeViewModel extends ChangeNotifier {
  final ILocalStorage _localStorage;
  final NewsRepository _newsRepository = NewsRepository();

  HomeViewModel({required ILocalStorage localStorage})
      : _localStorage = localStorage;
  List<INews> _newsData = [];

  List<INews> get newsData => _newsData;
  void _deleteEmailAndPassword() {
    _localStorage.delete(loginEmail);
    _localStorage.delete(loginPassword);
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
