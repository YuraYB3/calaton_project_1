import 'package:flutter/material.dart';
import 'package:project_1/app/screens/home/home_view.dart';
import 'package:project_1/app/screens/login/login_view.dart';

import 'routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case routeLogin:
        return MaterialPageRoute(builder: (_) => LoginView());

      case routeHome:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
    }
  }

  /* Widget _buildLoginSettings(RouteSettings settings) {
    // return LoginFactory.build();
    return Container();
  }

  Widget _buildHomeSettings(RouteSettings settings) {
    //  return HomeFactory.build();
    return Container();
  }*/
}
