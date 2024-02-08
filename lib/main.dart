import 'package:flutter/material.dart';
import 'package:project_1/app/app.dart';
import 'package:project_1/app/screens/home/home_view_model.dart';
import 'package:provider/provider.dart';

import 'app/screens/login/login_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        //  Provider.value(value: ),
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
      ],
      child: const App(),
    ),
  );
}
