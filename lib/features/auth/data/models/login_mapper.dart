import 'package:user_profile/features/auth/data/models/login_model.dart';
import 'package:user_profile/features/auth/domain/entities/login_entity.dart';

extension Mapper on LoginEntity {
  LoginModel toModel() => LoginModel(
        email: email,
        password: password,
      );
}
