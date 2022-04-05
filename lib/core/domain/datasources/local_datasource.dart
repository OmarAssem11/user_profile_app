abstract class LocalDataSource {
  Future<bool> saveToken(String token);
  String? getToken();
  Future<void> deleteToken();
}
