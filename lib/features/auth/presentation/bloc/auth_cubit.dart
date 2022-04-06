import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:user_profile/core/domain/entities/user.dart';
import 'package:user_profile/core/domain/usecases/usecase.dart';
import 'package:user_profile/features/auth/domain/entities/login_entity.dart';
import 'package:user_profile/features/auth/domain/usecases/login_use_case.dart';
import 'package:user_profile/features/auth/domain/usecases/logout_use_case.dart';
import 'package:user_profile/features/auth/domain/usecases/register_use_case.dart';
import 'package:user_profile/features/auth/presentation/bloc/auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._registerUserCase,
    this._loginUseCase,
    this._logout,
  ) : super(const AuthInitial());
  final RegisterUseCase _registerUserCase;
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logout;

  Future<void> register({required User user}) async {
    emit(const AuthLoading());
    final result = await _registerUserCase(
      RegisterData(
        user: user,
      ),
    );
    emit(
      result.fold(
        (error) => AuthErrorDetails(error.toString()),
        (_) => const AuthSuccess(),
      ),
    );
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(const AuthLoading());
    final result = await _loginUseCase(
      LoginData(
        loginEntity: LoginEntity(
          email: email,
          password: password,
        ),
      ),
    );
    emit(
      result.fold(
        (error) => const AuthErrorDetails('Network error'),
        (_) => const AuthSuccess(),
      ),
    );
  }

  Future<void> logout() async {
    emit(const AuthLoading());
    final result = await _logout(NoParams());
    emit(
      result.fold(
        (error) => const AuthErrorDetails('Network error'),
        (_) => const AuthSuccess(),
      ),
    );
  }
}
