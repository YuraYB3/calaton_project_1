import '../../domain/auth/iauth_service.dart';
import '../../domain/local_storage/ilocal_storage.dart';
import '../common/login_variables.dart';
import '../routing/routes.dart';

class AuthService implements IAuthService {
  String _initialRoute = routeLogin;
  final ILocalStorage localStorage;
  AuthService({required this.localStorage});
  @override
  String get initialRoute => _initialRoute;

  @override
  Future<void> initialize() async {
    await checkUserExist();
  }

  Future<void> checkUserExist() async {
    try {
      String email = await localStorage.read(loginEmail);
      String password = await localStorage.read(loginPassword);
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
