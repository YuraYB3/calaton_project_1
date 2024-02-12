abstract interface class INetworkService {
  void init();

  Future<dynamic> get(String endpoint, String query);
  Future<dynamic> post(
    String endpoint,
  );
  Future<dynamic> put();
  Future<dynamic> delete();
}
