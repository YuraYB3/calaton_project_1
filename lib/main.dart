import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'app/routing/inavigation_util.dart';
import 'app/routing/navigation_util.dart';
import 'app/screens/login/login_view_model.dart';
import 'app/services/auth_service.dart';
import 'app/services/local_storage/local_storage.dart';
import 'domain/auth/iauth_service.dart';
import 'domain/local_storage/ilocal_storage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final INavigationUtil navigationUtil = NavigationUtil();
  final ILocalStorage localStorage = LocalStorage();
  final IAuthService authService = AuthService(localStorage: localStorage);

  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: navigationUtil),
        Provider.value(value: localStorage),
        Provider.value(
          value: authService,
        ),
        ChangeNotifierProvider(
            create: (context) => LoginViewModel(localStorage: localStorage)),
      ],
      child: const App(),
    ),
  );
}
