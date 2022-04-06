import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:user_profile/core/domain/entities/user.dart';
import 'package:user_profile/core/domain/error/failure.dart';
import 'package:user_profile/core/domain/usecases/usecase.dart';
import 'package:user_profile/features/profile/domain/repositories/profile_repository.dart';

@injectable
class EditProfileUseCase implements UseCase<Unit, EditProfileData> {
  final ProfileRepository _profileRepository;
  EditProfileUseCase(this._profileRepository);

  @override
  Future<Either<Failure, Unit>> call(
    EditProfileData editProfileData,
  ) =>
      _profileRepository.editProfile(editProfileData);
}

class EditProfileData extends Equatable {
  final User user;
  final File? imageFile;

  const EditProfileData({
    required this.user,
    this.imageFile,
  });

  @override
  List<Object?> get props => [
        user,
        imageFile,
      ];
}
