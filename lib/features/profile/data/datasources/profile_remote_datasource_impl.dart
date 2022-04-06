import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:user_profile/core/data/models/user_model.dart';
import 'package:user_profile/features/profile/data/datasources/profile_api_service.dart';
import 'package:user_profile/features/profile/data/models/image_model.dart';
import 'package:user_profile/features/profile/domain/datasources/profile_remote_datasource.dart';

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ProfileApiService _profileApiService;
  const ProfileRemoteDataSourceImpl(this._profileApiService);

  @override
  Future<UserModel> editProfile({
    required String token,
    required UserModel userModel,
  }) =>
      _profileApiService.editProfile(
        token: token,
        userModel: userModel,
      );

  @override
  Future<UserModel> viewProfile({required String token}) =>
      _profileApiService.viewProfile(token: token);

  @override
  Future<ImageModel> uploadImage({required File image}) =>
      _profileApiService.uploadImage(image: image);
}
