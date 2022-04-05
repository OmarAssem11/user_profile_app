import 'package:dio/dio.dart';
import 'package:final_project/core/data/models/token_model.dart';
import 'package:final_project/core/data/models/user_model.dart';
import 'package:final_project/features/auth/data/models/login_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'auth_service.g.dart';

@lazySingleton
@RestApi()
abstract class AuthService {
  @factoryMethod
  factory AuthService(Dio dio) = _AuthService;

  @POST('register')
  Future<TokenModel> register({
    @Body() required UserModel userModel,
  });

  @POST('login')
  Future<TokenModel> login({
    @Body() required LoginModel loginModel,
  });

  @POST('logout')
  Future<String> logout({
    @Header('Authorization') required String token,
  });
}
