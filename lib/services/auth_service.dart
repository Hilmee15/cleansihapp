import 'dart:developer';

import 'package:cleansihapp/api/api.dart';
import 'package:cleansihapp/locals/secure_storage.dart';
import 'package:cleansihapp/models/user.dart';

import '../config/api_config.dart';

class AuthService {
  static Future<User?> login({
    required String username,
    required String password
}) async {
    try {
      const url = '${ApiConfig.baseUrl}${ApiConfig.login}';
      final data = {
        'username': username,
        'password': password,
      };
      log(data.toString());
      final response = await dio.post(
        url,
        data: data,
      );

      if (response.statusCode == 200) {
        final responseJson = response.data;
        final status = responseJson['status'];
        if (status == true) {
          final token = responseJson['access_token'];
          final user = User.fromJson(responseJson['data']);
          // ! Cache User dan token
          await SecureStorage.cacheToken(token: token);
          await SecureStorage.cacheUser(user: user);
          return user;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e, st) {
      log('$e $st');
      return null;
    }
  }
}