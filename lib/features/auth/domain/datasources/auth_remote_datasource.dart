import 'package:user_profile/core/data/models/user_model.dart';
import 'package:user_profile/features/auth/data/models/login_model.dart';
import 'package:user_profile/features/auth/data/models/token_model.dart';

abstract class AuthRemoteDataSource {
  Future<TokenModel> register({required UserModel userModel});
  Future<TokenModel> login({required LoginModel loginModel});
  Future<String> logout({required String token});
}
