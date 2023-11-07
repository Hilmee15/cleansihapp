import 'dart:developer';

import 'package:cleansihapp/pages/bottomnavbar.dart';
import 'package:cleansihapp/pages/homepage.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../models/user.dart';
import '../services/auth_service.dart';

class AuthController extends GetxController {
  var user = User().obs;
  var isLoading = false.obs;
  var isSuccess = false.obs;
  var isError = false.obs;
  var message = ''.obs;

  void login({
    required String username,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      print("Loading");
      final userData = await AuthService.login(
        username: username,
        password: password,
      );

      print("DI SINI BISA GK");

      user(userData);
      isSuccess.value = true;
      isLoading.value = false;
      Get.off(const BottomNavBar());
    } on DioError catch (e) {
      log(e.toString());
      message.value = 'Error';
      isError.value = true;
      isLoading.value = false;
    }
  }
}