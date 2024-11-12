import 'package:auth_page/SERVICES/dio.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PostController {
  Future<Map<String, dynamic>> register(Map<String, dynamic> data) async {
    try {
      Dio.Response response = await fetches().post('register', data: data);
      print(response);
      return {'statusCode': response.statusCode, 'data': response.data};
    } on Dio.DioException catch (e) {
      if (e.response?.statusCode == 409) {
        return {'statusCode': 409, 'message': 'Email already exists'};
      }

      return {
        'statusCode': e.response?.statusCode ?? 'error',
        'message': e.message
      };
    }
  }

  Future<Map<String, dynamic>> login(Map<String, dynamic> data) async {
    try {
      Dio.Response response = await fetches().post('login', data: data);
      print(response);
      if (response.statusCode == 200) {
        const storage = FlutterSecureStorage();
        await storage.write(key: 'token', value: response.data['token']);
        return {'statusCode': response.statusCode, 'data': response.data};
      }
      return {
        'statusCode': response.statusCode,
        'message': response.data['message']
      };
    } on Dio.DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return {
          'statusCode': 401,
          'message': 'invalid email address or password'
        };
      }
      return {
        'statusCode': e.response?.statusCode ?? 'error',
        'message': e.message
      };
    }
  }
}
