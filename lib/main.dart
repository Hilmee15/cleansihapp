import 'package:cleansihapp/api/api.dart';
import 'package:cleansihapp/pages/bottomnavbar.dart';
import 'package:cleansihapp/pages/loginpage.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

void main() {
  dio.interceptors.add(
    LogInterceptor(requestBody: true, responseBody: true),
  );
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
