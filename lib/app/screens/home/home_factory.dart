import 'package:flutter/material.dart';
import 'package:project_1/app/screens/home/home_view.dart';
import 'package:project_1/app/screens/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeFactory {
  static Widget build() {
    return ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: Consumer<HomeViewModel>(
          builder: (context, model, child) => const HomeView(),
        ));
  }
}
