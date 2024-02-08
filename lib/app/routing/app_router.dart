import 'package:flutter/material.dart';

import 'routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case routeLogin:
        return MaterialPageRoute(
            builder: (_) => _buildLoginSettings(routeSettings));

      case routeHome:
        return MaterialPageRoute(
            builder: (_) => _buildHomeSettings(routeSettings));
      default:
    }
  }

  Widget _buildLoginSettings(RouteSettings settings) {
    // return LoginFactory.build();
    return Container();
  }

  Widget _buildHomeSettings(RouteSettings settings) {
    //  return HomeFactory.build();
    return Container();
  }
}
