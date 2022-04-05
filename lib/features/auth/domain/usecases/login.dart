import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/core/domain/error/failure.dart';
import 'package:final_project/core/domain/usecases/usecase.dart';
import 'package:final_project/features/auth/domain/entities/login_entity.dart';
import 'package:final_project/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class Login implements UseCase<Unit, LoginData> {
  final AuthRepository _authRepository;
  Login(this._authRepository);
  @override
  Future<Either<Failure, Unit>> call(LoginData loginData) =>
      _authRepository.login(
        loginEntity: loginData.loginEntity,
      );
}

class LoginData extends Equatable {
  final LoginEntity loginEntity;

  const LoginData({
    required this.loginEntity,
  });

  @override
  List<Object?> get props => [
        loginEntity,
      ];
}
