import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:user_profile/core/domain/error/failure.dart';
import 'package:user_profile/core/domain/usecases/usecase.dart';
import 'package:user_profile/features/auth/domain/repositories/auth_repository.dart';

@injectable
class LogoutUseCase implements UseCase<Unit, NoParams> {
  final AuthRepository _authRepository;
  LogoutUseCase(this._authRepository);
  @override
  Future<Either<Failure, Unit>> call(NoParams noParams) =>
      _authRepository.logout();
}
