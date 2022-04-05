import 'package:dartz/dartz.dart';
import 'package:final_project/core/data/models/user_mapper.dart';
import 'package:final_project/core/data/models/user_model.dart';
import 'package:final_project/core/domain/datasources/local_datasource.dart';
import 'package:final_project/core/domain/entities/user.dart';
import 'package:final_project/core/domain/error/failure.dart';
import 'package:final_project/features/profile/data/datasources/profile_service.dart';
import 'package:final_project/features/profile/domain/repositories/profile_repository.dart';
import 'package:final_project/features/profile/domain/usecases/edit_profile.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileService _profileService;
  final LocalDataSource _localDataSource;
  ProfileRepositoryImpl(
    this._profileService,
    this._localDataSource,
  );

  @override
  Future<Either<Failure, User>> viewProfile() async {
    try {
      final token = _localDataSource.getToken()!;
      final user = await _profileService.viewProfile(token: 'Bearer $token');
      return right(user);
    } catch (error) {
      return left(Failure(error));
    }
  }

  @override
  Future<Either<Failure, Unit>> editProfile(
    EditProfileData editProfileData,
  ) async {
    try {
      final token = _localDataSource.getToken()!;
      if (editProfileData.imageFile != null) {
        final uploadedImageUrl = await _profileService.updateImage(
          image: editProfileData.imageFile!,
        );
        await _profileService.editProfile(
          token: 'Bearer $token',
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
        await _profileService.editProfile(
          token: 'Bearer $token',
          userModel: editProfileData.user.toModel(),
        );
      }
      return right(unit);
    } catch (error) {
      return left(const Failure('Network error'));
    }
  }
}
