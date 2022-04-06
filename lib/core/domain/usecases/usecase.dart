import 'package:dartz/dartz.dart';
import 'package:user_profile/core/domain/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
