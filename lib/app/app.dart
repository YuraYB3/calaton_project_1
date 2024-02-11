import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/auth/iauth_service.dart';
import 'common/widgets/loading.dart';
import 'routing/app_router.dart';
import 'routing/inavigation_util.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<IAuthService>(context, listen: false).initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return showLoading();
        } else {
          return const _AppContent();
        }
      },
    );
  }
}

class _AppContent extends StatelessWidget {
  const _AppContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AppRouter();
    final authService = Provider.of<IAuthService>(context, listen: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.onGenerateRoute,
      navigatorKey:
          Provider.of<INavigationUtil>(context, listen: false).navigatorKey,
      initialRoute: authService.initialRoute,
    );
  }
}
