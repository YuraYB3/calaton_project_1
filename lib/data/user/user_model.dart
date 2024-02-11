import '../../domain/user/iuser.dart';

class UserModel implements IUser {
  @override
  String email;

  @override
  String password;

  UserModel({required this.email, required this.password});
}
