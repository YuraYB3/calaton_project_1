import 'package:project_1/domain/news/inews.dart';

abstract interface class INewsRepository {
  Future<List<INews>> fetchData();
}
