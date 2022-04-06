import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:user_profile/core/data/mappers/user_mapper.dart';
import 'package:user_profile/core/domain/entities/user.dart';
import 'package:user_profile/core/domain/error/failure.dart';
import 'package:user_profile/features/auth/data/models/login_mapper.dart';
import 'package:user_profile/features/auth/domain/datasources/auth_local_datasource.dart';
import 'package:user_profile/features/auth/domain/datasources/auth_remote_datasource.dart';
import 'package:user_profile/features/auth/domain/entities/login_entity.dart';
import 'package:user_profile/features/auth/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _localDataSource;
  AuthRepositoryImpl(
    this._authRemoteDataSource,
    this._localDataSource,
  );

  @override
  Future<Either<Failure, Unit>> register({
    required User user,
  }) async {
    try {
      final token =
          await _authRemoteDataSource.register(userModel: user.toModel);
      await _localDataSource.saveToken(token.token);
      return right(unit);
    } catch (error) {
      return left(const Failure('Error while register'));
    }
  }

  @override
  Future<Either<Failure, Unit>> login({
    required LoginEntity loginEntity,
  }) async {
    try {
      final token = await _authRemoteDataSource.login(
        loginModel: loginEntity.toModel(),
      );
      await _localDataSource.saveToken(token.token);
      return right(unit);
    } catch (error) {
      return left(const Failure('Error while login'));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      final token = _localDataSource.getToken()!;
      await _localDataSource.deleteToken();
      await _authRemoteDataSource.logout(token: token);
      return right(unit);
    } catch (error) {
      return left(const Failure('Error while logout'));
    }
  }
}
