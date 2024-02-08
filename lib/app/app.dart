import 'package:flutter/material.dart';
import 'package:project_1/app/routing/app_router.dart';
import 'package:project_1/app/routing/routes.dart';

import 'routing/inavigation_util.dart';

class App extends StatefulWidget {
  final INavigationUtil navigationUtil;

  App({Key? key, required this.navigationUtil}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AppRouter router = AppRouter();

  String initialRoute = routeLogin;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.onGenerateRoute,
      navigatorKey: widget.navigationUtil.navigatorKey,
      initialRoute: initialRoute,
    );
  }
}
