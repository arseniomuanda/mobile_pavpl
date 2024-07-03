import 'dart:developer';
import 'package:dio/dio.dart';

import '../models/base_error.model.dart';

const baseUrl = 'localhost:8000/api/v1/';

class APIClient {
  static final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );

  /// Reauthentication interceptor
  static void reauthenticateInterceptor() {
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {},
        onResponse: (response, handler) {},
        onError: (DioError e, handler) async {
          if (e.response?.statusCode == 401) {}
        }));
  }

  /// HTTP request [GET]
  static Future<dynamic> get(String url,
      {Map<String, dynamic>? headers}) async {
    try {
      log('URL: $url');
      log("METHOD: GET");
      log('HEADERS: $headers');
      log('Full Path: ${dio.options.baseUrl + url}');
      final response = await dio.get(
        url,
        options: Options(headers: headers!),
      );
      return response.data;
    } on DioError catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<dynamic> delete(String url,
      {Map<String, dynamic>? headers}) async {
    try {
      log('URL: $url');
      log("METHOD: DELETE");
      log('HEADERS: $headers');
      log('Full Path: ${dio.options.baseUrl + url}');
      final response = await dio.delete(
        url,
        options: Options(headers: headers!),
      );
      return response.data;
    } on DioError catch (e) {
      print(e);
      throw e;
    }
  }

  /// HTTP request [POST] with payload [data]
  static Future<dynamic> post(String url,
      {dynamic data, Map<String, dynamic>? headers}) async {
    log('URL: $url');
    log("METHOD: POST");
    log('DATA: $data');
    log('Full Path: ${dio.options.baseUrl + url}');
    try {
      final response =
      await dio.post(url, data: data, options: Options(headers: headers));
      //print(response);
      return response.data;
    } on DioError catch (e) {
      print(e);
      return BaseErrorModel.fromJson(e.response?.data);
    }
  }
}