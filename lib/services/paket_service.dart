import 'package:cleansihapp/config/api_config.dart';
import 'package:cleansihapp/models/paket.dart';
import 'package:dio/dio.dart';

import '../api/api.dart';

class PaketService {
  static Future<List<Paket>> getPaket() async {
    const url = ApiConfig.paket;
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final responseJson = response.data;
        final List listData = responseJson['data'];
        final List<Paket> paket = [];
        for (final element in listData) {
          paket.add(Paket.fromJson(element));
        }
        return paket;
      }
      return [];
    } on DioError catch (e) {
      return [];
    } catch (e) {
      return [];
    }
  }
}