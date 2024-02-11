import 'inews.dart';

abstract interface class INewsRepository {
  Future<List<INews>> fetchData();
}
