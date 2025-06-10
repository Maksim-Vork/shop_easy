import 'dart:io';

import 'package:chill_market/core/Service/LocalStoredToken/auth_local_token.dart';
import 'package:chill_market/core/exceptions/app_exception.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioService {
  late final Dio _dio;
  final AuthLocalTokenService authLocalTokenService;

  DioService(this.authLocalTokenService) {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://api.escuelajs.co/api/v1/",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Accept': 'application/json',
          if (Platform.isMacOS) 'Origin': 'http://localhost',
        },
      ),
    );

    if (Platform.isMacOS) {
      (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (
        HttpClient client,
      ) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }

    _dio.interceptors.addAll([
      LogInterceptor(
        // request: false,
        requestHeader: false,
        requestBody: false,
        responseHeader: false,
        responseBody: false,
        error: true,
      ),
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await authLocalTokenService.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException error, handler) {
          stdout.write('❌ Ошибка: ${error.type}');
          stdout.write('🔗 URL: ${error.requestOptions.uri}');
          stdout.write('📦 Ответ: ${error.response?.data ?? 'Нет данных'}');

          if (error.type == DioExceptionType.connectionError) {
            stdout.write('⚠️ Проверьте интернет-соединение');
          }

          return handler.next(error);
        },
      ),
    ]);
  }

  Future<Response> post(String endpoint, dynamic data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;

      if (statusCode == 400) {
        throw AppException(error: 'Неверные данные');
      } else if (statusCode == 401) {
        throw AppException(error: 'Неверный email/пароль');
      } else if (statusCode == 409) {
        throw AppException(error: 'Пользователь уже зарегистрирован');
      } else if (statusCode == 404) {
        throw AppException(error: 'Пользователь не найден');
      } else if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.unknown) {
        throw AppException(error: 'Ошибка сети. Проверьте интернет-соединение');
      } else {
        throw AppException(error: 'Ошибка сервера: ${e.message}');
      }
    } catch (e) {
      throw AppException(error: 'Произошла непредвиденная ошибка');
    }
  }

  Future<Response> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response;
    } on DioException catch (e) {
      throw AppException(error: 'Ошибка при GET запросе: ${e.message}');
    }
  }
}
