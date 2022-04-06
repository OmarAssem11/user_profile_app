import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:user_profile/core/data/constants/constants.dart';
import 'package:user_profile/core/data/models/user_model.dart';
import 'package:user_profile/features/profile/data/models/image_model.dart';
part 'profile_api_service.g.dart';

@lazySingleton
@RestApi()
abstract class ProfileApiService {
  @factoryMethod
  factory ProfileApiService(Dio dio) = _ProfileApiService;

  @GET(viewProfileEndpoint)
  Future<UserModel> viewProfile({
    @Header(authorization) required String token,
  });

  @POST(editProfileEndpoint)
  Future<UserModel> editProfile({
    @Header(authorization) required String token,
    @Body() required UserModel userModel,
  });

  @POST(imageApiBaseUrl)
  @MultiPart()
  Future<ImageModel> uploadImage({
    @Part() @Query('key') String key = imageApiKey,
    @Part(name: 'image') required File image,
  });
}
