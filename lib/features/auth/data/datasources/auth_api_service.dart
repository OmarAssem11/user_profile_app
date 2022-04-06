import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:user_profile/core/data/constants/constants.dart';
import 'package:user_profile/core/data/models/user_model.dart';
import 'package:user_profile/features/auth/data/models/login_model.dart';
import 'package:user_profile/features/auth/data/models/token_model.dart';
part 'auth_api_service.g.dart';

@lazySingleton
@RestApi()
abstract class AuthApiService {
  @factoryMethod
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST(registerEndpoint)
  Future<TokenModel> register({
    @Body() required UserModel userModel,
  });

  @POST(loginEndpoint)
  Future<TokenModel> login({
    @Body() required LoginModel loginModel,
  });

  @POST(logoutEndpoint)
  Future<String> logout({
    @Header(authorization) required String token,
  });
}
