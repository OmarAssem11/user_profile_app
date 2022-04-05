import 'package:dartz/dartz.dart';
import 'package:final_project/core/domain/entities/user.dart';
import 'package:final_project/core/domain/error/failure.dart';
import 'package:final_project/features/profile/domain/usecases/edit_profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, User>> viewProfile();
  Future<Either<Failure, Unit>> editProfile(EditProfileData editProfileData);
}
