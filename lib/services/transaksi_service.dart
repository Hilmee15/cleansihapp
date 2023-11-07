import 'dart:convert';

import 'package:cleansihapp/config/api_config.dart';
import 'package:cleansihapp/models/transaksi.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../api/api.dart';

class TransaksiService {
  static Future<List<Transaksi>> getTransaksi() async {
    const url = ApiConfig.transaksi;
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final responseJson = response.data;
        final List listData = responseJson['data'];
        final List<Transaksi> transaksi = [];
        for (final element in listData) {
          transaksi.add(Transaksi.fromJson(element));
        }
        return transaksi;
      }
      return [];
    } on DioError catch (e) {
      return [];
    } catch (e) {
      return [];
    }
  }
}
