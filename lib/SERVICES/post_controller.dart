import 'package:auth_page/SERVICES/dio.dart';
import 'package:dio/dio.dart' as Dio;
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
// const String registerUrl = 'http://localhost:3000/api/v1/auth/register';
// const String loginUrl = 'http://localhost:3000/api/v1/auth/login';

class PostController {
  Future register(Map<String, dynamic> data) async {
    try {
      Dio.Response response = await fetches().post('register', data: data);
      print(response);
      return response.data;
      // return {'statusCode': response.statusCode, 'data': response.data};
    } on Dio.DioException catch (e) {
      return {'statusCode': 'error', 'message': e.error};
    }
  }

  Future login(String email, String password) async {
    try {
      // final response = await _dio.post(loginUrl, data: {
      //   'email': email,
      //   'password': password,
      // });

      // if (response.statusCode == 200) {
      //   await _secureStorage.write(key: 'token', value: response.data['token']);
      //   print('Login successful');
      // } else {
      //   print('Failed to login');
      // }
    } catch (e) {
      print('Error during login: $e');
    }
  }
}
