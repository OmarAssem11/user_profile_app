import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:user_profile/core/domain/entities/user.dart';
import 'package:user_profile/core/domain/error/failure.dart';
import 'package:user_profile/core/domain/usecases/usecase.dart';
import 'package:user_profile/features/auth/domain/repositories/auth_repository.dart';

@injectable
class RegisterUseCase implements UseCase<Unit, RegisterData> {
  final AuthRepository _authRepository;
  RegisterUseCase(this._authRepository);

  @override
  Future<Either<Failure, Unit>> call(RegisterData registerData) =>
      _authRepository.register(
        user: registerData.user,
      );
}

class RegisterData extends Equatable {
  final User user;
  const RegisterData({
    required this.user,
  });

  @override
  List<Object?> get props => [
        user,
      ];
}
