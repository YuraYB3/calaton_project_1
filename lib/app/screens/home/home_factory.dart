import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/local_storage/ilocal_storage.dart';
import '../../services/networking/inetwork_service.dart';
import 'home_view.dart';
import 'home_view_model.dart';

class HomeFactory {
  static Widget build() {
    return ChangeNotifierProvider(
        create: (context) => HomeViewModel(
            localStorage: Provider.of<ILocalStorage>(context, listen: false),
            networkService:
                Provider.of<INetworkService>(context, listen: false)),
        child: Consumer<HomeViewModel>(
          builder: (context, model, child) => HomeView(viewModel: model),
        ));
  }
}
