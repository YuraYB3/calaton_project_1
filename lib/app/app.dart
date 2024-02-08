import 'package:flutter/material.dart';
import 'package:project_1/app/routing/routes.dart';

import 'screens/home/home_view.dart';
import 'screens/login/login_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginView(),
        '/$routeHome': (context) => const HomeView(),
      },
    );
  }
}
