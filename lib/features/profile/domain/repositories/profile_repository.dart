import 'package:dartz/dartz.dart';
import 'package:user_profile/core/domain/entities/user.dart';
import 'package:user_profile/core/domain/error/failure.dart';
import 'package:user_profile/features/profile/domain/usecases/edit_profile_use_case.dart';

abstract class ProfileRepository {
  Future<Either<Failure, User>> viewProfile();
  Future<Either<Failure, Unit>> editProfile(EditProfileData editProfileData);
}
