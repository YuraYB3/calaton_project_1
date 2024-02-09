import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'app/routing/inavigation_util.dart';
import 'app/routing/navigation_util.dart';
import 'app/screens/login/login_view_model.dart';

void main() {
  final INavigationUtil navigationUtil = NavigationUtil();

  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: navigationUtil),
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
      ],
      child: const App(),
    ),
  );
}
