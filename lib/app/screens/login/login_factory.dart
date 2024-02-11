import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/local_storage/ilocal_storage.dart';
import 'login_view.dart';
import 'login_view_model.dart';

class LoginFactory {
  static Widget build() {
    return ChangeNotifierProvider(
        create: (context) => LoginViewModel(
            localStorage: Provider.of<ILocalStorage>(context, listen: false)),
        child: Consumer<LoginViewModel>(
          builder: (context, model, child) => LoginView(viewModel: model),
        ));
  }
}
