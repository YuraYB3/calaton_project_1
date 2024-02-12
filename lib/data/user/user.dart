import '../../domain/user/iuser.dart';

class User implements IUser {
  @override
  String email;

  @override
  String password;

  User({required this.email, required this.password});
}
