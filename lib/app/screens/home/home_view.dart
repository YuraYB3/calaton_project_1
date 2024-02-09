import 'package:flutter/material.dart';
import 'package:project_1/app/screens/home/home_view_model.dart';

import '../../../domain/news/inews.dart';
import '../../common/widgets/loading.dart';
import '../../theme/color_palete.dart';
import 'widgets/list_of_news.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  HomeViewModel home = HomeViewModel();
  List<INews> dataList = [];
  final ColorsPalete _colorsPalete = ColorsPalete();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<List<INews>> fetchData() async {
    List<INews> newData = await home.fetchData();
    setState(() {
      dataList = newData;
    });
    return newData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _colorsPalete.backgroundColor,
      ),
      body: Center(
        child: dataList.isEmpty ? showLoading() : listOfNewsWidget(dataList),
      ),
    );
  }
}
