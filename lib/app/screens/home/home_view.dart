import 'package:flutter/material.dart';
import 'package:project_1/app/screens/home/home_view_model.dart';

import '../../common/widgets/loading.dart';
import '../../theme/color_palete.dart';
import 'widgets/list_of_news.dart';

class HomeView extends StatefulWidget {
  final HomeViewModel viewModel;
  const HomeView({required this.viewModel, super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final ColorsPalete _colorsPalete = ColorsPalete();

  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _colorsPalete.backgroundColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: widget.viewModel.newsData.isEmpty
            ? showLoading()
            : listOfNewsWidget(widget.viewModel.newsData),
      ),
    );
  }
}
