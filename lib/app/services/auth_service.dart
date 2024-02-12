import '../../domain/auth/iauth_service.dart';
import '../../domain/local_storage/ilocal_storage.dart';
import '../routing/routes.dart';
import 'local_storage/keys/keys.dart';

class AuthService implements IAuthService {
  String _initialRoute = routeLogin;
  final ILocalStorage localStorage;
  AuthService({required this.localStorage});
  @override
  String get initialRoute => _initialRoute;

  @override
  Future<void> initialize() async {
    await _checkUserExist();
  }

  Future<void> _checkUserExist() async {
    try {
      String email = await localStorage.read(keyEmail);
      String password = await localStorage.read(keyPassword);
      if (email.isNotEmpty && password.isNotEmpty) {
        _initialRoute = routeHome;
      } else {
        _initialRoute = routeLogin;
      }
    } catch (err) {
      _initialRoute = routeLogin;
    }
  }
}
