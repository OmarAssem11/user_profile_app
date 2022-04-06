import 'package:user_profile/core/data/models/user_model.dart';
import 'package:user_profile/core/domain/entities/user.dart';

extension Mapper on User {
  UserModel get toModel => UserModel(
        name: name,
        email: email,
        password: password,
        phone: phone,
        imageUrl: imageUrl,
        address: address,
        age: age,
      );
}
