abstract interface class INetworkService {
  void init();

  Future<dynamic> get(String endpoint, String query);
  Future<dynamic> put(String endpoint, dynamic data);
  Future<dynamic> post(String endpoint, dynamic data);
  Future<dynamic> delete(String endpoint, dynamic data);
}
