//8606b4b05fdb4a99a3e944b172293a8a
//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=8606b4b05fdb4a99a3e944b172293a8a
// /v2/top-headlines
// ?country=eg&category=business&apiKey=8606b4b05fdb4a99a3e944b172293a8a

import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  //ميثود علشان تملى الابوجكت اول ما افتح الاب لاني هستخدمه بعد كده في اماكن كتير فا علشان ميبقاش ب null بعمل كده
  static void init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true),
    );
  }
  //فنكشن جنريك هتاخد مني اي endpoint , queries
  static Future<Response> getData({required String url, required Map<String, dynamic>? query})async {
    return await dio.get(url, queryParameters: query);
  }
}
