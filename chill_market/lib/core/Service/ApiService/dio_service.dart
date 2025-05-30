import 'dart:io';

import 'package:chill_market/core/exceptions/app_exception.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioService {
  late final Dio _dio;

  DioService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://api.escuelajs.co/api/v1/",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Accept': 'application/json',
          if (Platform.isMacOS) 'Origin': 'http://localhost', // Для CORS
        },
      ),
    );
    if (Platform.isMacOS) {
      (_dio.httpClientAdapter as IOHttpClientAdapter)
          // ignore: deprecated_member_use
          .onHttpClientCreate = (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
    _dio.interceptors.addAll([
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = ''; // заменить на получение токена с сервиса
          if (token != 0) {
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

      print('успешно вошел');
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
    final response = await _dio.get(endpoint);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
