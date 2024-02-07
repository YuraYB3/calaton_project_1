import 'package:flutter/material.dart';
import 'package:project_1/app/app.dart';
import 'package:project_1/data/news_repository.dart';
import 'package:provider/provider.dart';

import 'app/screens/login/login_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsRepository()),
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
      ],
      child: const App(),
    ),
  );
}
