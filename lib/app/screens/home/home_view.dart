import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/news_repository.dart';
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
  late final NewsRepository _newsService =
      Provider.of<NewsRepository>(context, listen: false);
  List<INews> dataList = [];
  final ColorsPalete _colorsPalete = ColorsPalete();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<List<INews>> fetchData() async {
    List<INews> newData = await _newsService.fetchData();
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
