import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:user_profile/core/domain/entities/user.dart';
import 'package:user_profile/core/domain/error/failure.dart';
import 'package:user_profile/core/domain/usecases/usecase.dart';
import 'package:user_profile/features/profile/domain/repositories/profile_repository.dart';

@injectable
class ViewProfileUseCase implements UseCase<User, NoParams> {
  final ProfileRepository _profileRepository;
  ViewProfileUseCase(this._profileRepository);

  @override
  Future<Either<Failure, User>> call(
    NoParams noParams,
  ) =>
      _profileRepository.viewProfile();
}
