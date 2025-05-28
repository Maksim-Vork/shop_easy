import 'dart:io';

import 'package:chill_market/core/ApiService/dio_service.dart';
import 'package:chill_market/features/auth/data/models/login_model.dart';
import 'package:chill_market/features/auth/data/models/register_model.dart';

class AuthRemoteDataSource {
  final DioService dioService;

  AuthRemoteDataSource({required this.dioService});

  Future<String> login(LoginModel loginModel) async {
    try {
      final Map<String, dynamic> data = loginModel.toJson();
      final response = await dioService.post('auth/login', data);
      final String token = response.data as String;

      return token;
    } catch (e) {
      stdout.write('Ошибка типа: $e');
      throw Exception('Не удалось выполнить вход: $e');
    }
  }

  Future<void> register(RegisterModel registerModel) async {
    try {
      final Map<String, dynamic> data = registerModel.toJson();
      await dioService.post('users/', data);
    } catch (e) {
      stdout.write('Ошибка типа: $e');
      throw Exception('Не удалось зарегистрироваться: $e');
    }
  }
}
