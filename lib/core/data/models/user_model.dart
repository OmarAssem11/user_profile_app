import 'package:user_profile/core/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String imageUrl,
    required String address,
    required String age,
  }) : super(
          name: name,
          email: email,
          password: password,
          phone: phone,
          imageUrl: imageUrl,
          address: address,
          age: age,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final userData = json['data'] as Map<String, dynamic>;
    return UserModel(
      name: userData['name'] as String,
      email: userData['email'] as String,
      password: '',
      phone: userData['phone'] as String,
      imageUrl: userData['image'] as String,
      address: userData['address'] as String,
      age: userData['age'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password,
        'phone': phone,
        'image': imageUrl,
        'address': address,
        'age': age,
      };
}
