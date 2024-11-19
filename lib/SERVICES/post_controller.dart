import 'package:auth_page/SERVICES/dio.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PostController {
  Future<Map<String, dynamic>> register(Map<String, dynamic> data) async {
    try {
      Dio.Response response = await fetches().post('auth/register', data: data);
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
      Dio.Response response = await fetches().post('auth/login', data: data);
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
          'message': 'Invalid email address or password'
        };
      }
      return {
        'statusCode': e.response?.statusCode ?? 'error',
        'message': e.message
      };
    }
  }

  Future<Map<String, dynamic>> updateUser(
      String userId, Map<String, dynamic> data) async {
    try {
      Dio.Response response = await fetches().put('users/$userId', data: data);
      print(response);
      return {'statusCode': response.statusCode, 'data': response.data};
    } on Dio.DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return {'statusCode': 404, 'message': 'User not found'};
      }
      if (e.response?.statusCode == 409) {
        return {'statusCode': 409, 'message': 'Email already exists'};
      }
      return {
        'statusCode': e.response?.statusCode ?? 'error',
        'message': e.message
      };
    }
  }

  Future<Map<String, dynamic>> deleteUser(String userId) async {
    try {
      Dio.Response response = await fetches().delete('users/$userId');
      return {
        'statusCode': response.statusCode,
        'message': 'User deleted successfully'
      };
    } on Dio.DioException catch (e) {
      return {'statusCode': 500, 'message': e.message};
    }
  }

  Future<Map<String, dynamic>> getUser(String userId) async {
    try {
      Dio.Response response = await fetches().get('users/$userId');
      if (response.statusCode == 200) {
        return {'statusCode': response.statusCode, 'user': response.data};
      } else {
        return {'statusCode': response.statusCode, 'message': 'User not found'};
      }
    } on Dio.DioException catch (e) {
      return {
        'statusCode': e.response?.statusCode ?? 'error',
        'message': e.message
      };
    }
  }

  Future logout(BuildContext context) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.delete(key: 'token');
      Navigator.pushReplacementNamed(context, '/home');

      print('Logged out successfully');
    } catch (e) {
      print('Error logging out: $e');
    }
  }
}
