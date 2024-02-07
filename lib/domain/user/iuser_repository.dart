import 'iuser.dart';

abstract interface class IUserRepository {
  Future<List<IUser>> fetchData();
}
