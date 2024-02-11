abstract interface class IAuthService {
  String get initialRoute;

  Future<void> initialize();
}
