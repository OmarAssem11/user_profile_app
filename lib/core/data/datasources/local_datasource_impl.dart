import 'package:final_project/core/domain/datasources/local_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences _sharedPreferences;
  LocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<bool> saveToken(String token) async =>
      _sharedPreferences.setString('token', token);

  @override
  String? getToken() => _sharedPreferences.getString('token');

  @override
  Future<void> deleteToken() async => _sharedPreferences.remove('token');
}
