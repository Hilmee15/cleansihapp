import 'package:cleansihapp/config/api_config.dart';
import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: ApiConfig.baseUrl
  )
);