import 'dart:io';

import 'package:chill_market/core/ApiService/dio_service.dart';
import 'package:chill_market/core/exceptions/app_exception.dart';
import 'package:chill_market/features/auth/data/models/login_model.dart';
import 'package:chill_market/features/auth/data/models/register_model.dart';
import 'package:chill_market/features/auth/data/models/token_model.dart';

class AuthRemoteDataSource {
  final DioService dioService;

  AuthRemoteDataSource({required this.dioService});

  Future<String> login(LoginModel loginModel) async {
    try {
      final Map<String, dynamic> data = loginModel.toJson();
      final response = await dioService.post('auth/login', data);
      final TokenModel tokenModel = TokenModel.fromJson(response.data);
      final String token = tokenModel.accessToken;

      return token;
    } on AppException catch (e) {
      throw AppException(error: e.error);
    } catch (e) {
      throw AppException(error: 'Не удалось выполнить вход');
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
