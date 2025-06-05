import 'package:chill_market/features/auth/domain/entity/login.dart';

class LoginModel {
  final String email;
  final String password;

  LoginModel({required this.email, required this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(email: json['email'], password: json['password']);
  }
  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }

  factory LoginModel.fromEntity(Login login) {
    return LoginModel(email: login.email, password: login.password);
  }
}
