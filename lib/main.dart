import 'package:flutter/material.dart';
import 'package:project_1/app/app.dart';
import 'package:project_1/app/routing/inavigation_util.dart';
import 'package:project_1/app/routing/navigation_util.dart';
import 'package:project_1/app/screens/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'app/screens/login/login_view_model.dart';

void main() {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final INavigationUtil navigationUtil = NavigationUtil(navigatorKey);

  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: navigationUtil),
        ChangeNotifierProvider(
            create: (context) =>
                LoginViewModel(navigationUtil: navigationUtil)),
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
      ],
      child: App(
        navigationUtil: navigationUtil,
      ),
    ),
  );
}
