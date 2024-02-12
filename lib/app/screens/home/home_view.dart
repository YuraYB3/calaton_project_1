import 'package:flutter/material.dart';

import '../../common/widgets/loading.dart';
import '../../theme/color_palete.dart';
import 'home_view_model.dart';
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
            icon: const Icon(Icons.logout_rounded),
            onPressed: () {
              widget.viewModel.onLogOutButtonPressed(context);
            },
          ),
        ],
      ),
      body: Center(
        child: widget.viewModel.newsData.isEmpty
            ? const Loading()
            : ListOfNews(dataList: widget.viewModel.newsData),
      ),
    );
  }
}
