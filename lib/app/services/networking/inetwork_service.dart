abstract interface class INetworkService {
  void init();

  Future<dynamic> get(String endpoint, String query);
}
