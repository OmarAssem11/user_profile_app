import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_profile/features/auth/domain/datasources/auth_local_datasource.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences _sharedPreferences;
  AuthLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<bool> saveToken(String token) async =>
      _sharedPreferences.setString('token', token);

  @override
  String? getToken() => _sharedPreferences.getString('token');

  @override
  Future<void> deleteToken() async => _sharedPreferences.remove('token');
}
