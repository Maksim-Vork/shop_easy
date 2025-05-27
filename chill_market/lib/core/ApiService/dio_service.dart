import 'dart:io';

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
          final token = '123213'; // заменить на получение токена с сервиса
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
      return response;
    } on DioException catch (e) {
      throw Exception('Ошибка сервера: ${e.response?.statusCode}');
    }
  }

  Future<Response> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response;
    } on DioException catch (e) {
      throw Exception('Ошибка сервера: ${e.response?.statusCode}');
    }
  }
}
