import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final dio = Dio();

Dio fetches() {
  dio.options.baseUrl = 'http://localhost:3000/api/v1/auth/';
  dio.options.connectTimeout = Duration(seconds: 60);
  dio.options.receiveTimeout = Duration(seconds: 60);
  dio.interceptors.add(InterceptorsWrapper(
    onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      // const storage = FlutterSecureStorage();
      // final token = await storage.read(key: 'token');

      // options.headers['Authorization'] = token;
    },
    onResponse: (Response response, ResponseInterceptorHandler handler) async {
      if (response.statusCode! > 400) {
        throw Exception(
            'Request failed with status ${response.statusCode}: ${response.data}');
      }
    },
  ));

  return dio;
}
