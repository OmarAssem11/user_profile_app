import 'dart:io';
import 'package:user_profile/core/data/models/user_model.dart';
import 'package:user_profile/features/profile/data/models/image_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UserModel> viewProfile({required String token});
  Future<UserModel> editProfile({
    required String token,
    required UserModel userModel,
  });
  Future<ImageModel> uploadImage({required File image});
}
