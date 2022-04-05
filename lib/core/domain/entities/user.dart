import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String password;
  final String phone;
  final String imageUrl;
  final String address;
  final String age;

  const User({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.imageUrl,
    required this.address,
    required this.age,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        phone,
        imageUrl,
        address,
        age,
      ];
}
