import 'package:user_profile/features/auth/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    required String email,
    required String password,
  }) : super(
          email: email,
          password: password,
        );

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        email: json['email'] as String,
        password: json['password'] as String,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
