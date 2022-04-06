import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:user_profile/core/data/constants/constants.dart';
import 'package:user_profile/core/data/mappers/user_mapper.dart';
import 'package:user_profile/core/data/models/user_model.dart';
import 'package:user_profile/core/domain/entities/user.dart';
import 'package:user_profile/core/domain/error/failure.dart';
import 'package:user_profile/features/auth/domain/datasources/auth_local_datasource.dart';
import 'package:user_profile/features/profile/domain/datasources/profile_remote_datasource.dart';
import 'package:user_profile/features/profile/domain/repositories/profile_repository.dart';
import 'package:user_profile/features/profile/domain/usecases/edit_profile_use_case.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _profileRemoteDataSource;
  final AuthLocalDataSource _localDataSource;
  ProfileRepositoryImpl(
    this._profileRemoteDataSource,
    this._localDataSource,
  );

  @override
  Future<Either<Failure, User>> viewProfile() async {
    try {
      final token = _localDataSource.getToken()!;
      final user = await _profileRemoteDataSource.viewProfile(
        token: '$tokenType $token',
      );
      return right(user);
    } catch (error) {
      return left(const Failure('Error while viewing profile'));
    }
  }

  @override
  Future<Either<Failure, Unit>> editProfile(
    EditProfileData editProfileData,
  ) async {
    try {
      final token = _localDataSource.getToken()!;
      if (editProfileData.imageFile != null) {
        final uploadedImageUrl = await _profileRemoteDataSource.uploadImage(
          image: editProfileData.imageFile!,
        );
        await _profileRemoteDataSource.editProfile(
          token: '$tokenType $token',
          userModel: UserModel(
            name: editProfileData.user.name,
            email: editProfileData.user.email,
            password: editProfileData.user.password,
            phone: editProfileData.user.phone,
            imageUrl: uploadedImageUrl.url,
            address: editProfileData.user.address,
            age: editProfileData.user.age,
          ),
        );
      } else {
        await _profileRemoteDataSource.editProfile(
          token: '$tokenType $token',
          userModel: editProfileData.user.toModel,
        );
      }
      return right(unit);
    } catch (error) {
      return left(const Failure('Error while editing profile'));
    }
  }
}
