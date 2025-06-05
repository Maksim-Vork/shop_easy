import 'package:chill_market/features/auth/domain/entity/register.dart';

class RegisterModel {
  final String name;
  final String email;
  final String password;
  final String avatar;

  RegisterModel({
    required this.name,
    required this.email,
    required this.password,
    String? avatar,
  }) : avatar =
           avatar ??
           'https://yandex.by/images/search?text=%D0%B0%D0%B2%D0%B0%D1%82%D0%B0%D1%80%D0%BA%D0%B0&pos=3&rpt=simage&img_url=https%3A%2F%2Fyt3.googleusercontent.com%2Fxz0aPMUXSy4zOhyt0Jxycav481U1irVoBSXjxeFBi6z3s_8gbEY65I0_lUOWSd9-xB0TFK7Q%3Ds900-c-k-c0x00ffffff-no-rj&from=tabbar&lr=155';

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'avatar': avatar,
    };
  }

  factory RegisterModel.fromEntity(Register register) {
    return RegisterModel(
      name: register.name,
      email: register.email,
      password: register.password,
    );
  }
}
