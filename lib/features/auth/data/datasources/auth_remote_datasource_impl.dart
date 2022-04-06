import 'package:user_profile/core/data/models/user_model.dart';
import 'package:user_profile/features/auth/data/datasources/auth_api_service.dart';
import 'package:user_profile/features/auth/data/models/login_model.dart';
import 'package:user_profile/features/auth/data/models/token_model.dart';
import 'package:user_profile/features/auth/domain/datasources/auth_remote_datasource.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiService _authApiService;
  const AuthRemoteDataSourceImpl(this._authApiService);

  @override
  Future<TokenModel> register({
    required UserModel userModel,
  }) =>
      _authApiService.register(userModel: userModel);

  @override
  Future<TokenModel> login({required LoginModel loginModel}) =>
      _authApiService.login(loginModel: loginModel);

  @override
  Future<String> logout({required String token}) =>
      _authApiService.logout(token: token);
}
