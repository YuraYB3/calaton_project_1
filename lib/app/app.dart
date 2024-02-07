import 'package:flutter/material.dart';

import 'screens/home/home_view.dart';
import 'screens/login/login_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginView(),
        '/homescreen': (context) => const HomeView(),
      },
    );
  }
}
