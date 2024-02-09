import 'package:flutter/material.dart';
import 'package:project_1/app/routing/app_router.dart';
import 'package:project_1/app/routing/routes.dart';
import 'package:provider/provider.dart';

import 'routing/inavigation_util.dart';

class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AppRouter router = AppRouter();

  String initialRoute = routeLogin;

  @override
  Widget build(BuildContext context) {
    final INavigationUtil navigationUtil =
        Provider.of<INavigationUtil>(context, listen: false);
    return MaterialApp(
      onGenerateRoute: router.onGenerateRoute,
      navigatorKey: navigationUtil.navigatorKey,
      initialRoute: initialRoute,
    );
  }
}
