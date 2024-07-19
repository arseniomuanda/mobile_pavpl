import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:pavpl_app/app/models/base_error.model.dart';

// TODO: #3 #2 Criar uma funçao para fazer logout e bloquar a conta sempre que estiver logado em 2 dispositivos ao mesmo tempo
abstract class Endpoints {
  String baseUrl = 'app.helplocal.com.br';
  //String baseUrl = 'localhost:8080';
  String login = '/login';
  String register = '/user';
  String logout = '/logout';
  String products = '/products';
  String markets = '/markets';
  String fuel = '/fuels';
  String addCart = '/add_cart';
  String singleCartState = '/single_cart_state';
  String compare = '/comparemany?list=';
  String allCartState = '/all_cart_state';
  String showCart = '/show_cart';
  String removeCart = '/rem_cart';
  String deleteCart = '/delete_cart';
}

class MapConstants {
  static const String mapBoxAccessToken =
      'pk.eyJ1IjoiYXJzZW5pb211YW5kYSIsImEiOiJjbGt3a2k1d2kwa2g5M2pwa2dsbnYyejg2In0.Amv8PgQkIrVWIEUsDP776g';

  static const String mapBoxStyleId = 'cjikt35x83t1z2rnxpdmjs7y7';
}

class APIClient {
  static final dio = Dio(
    BaseOptions(
      //baseUrl: 'http://localhost:8080/api',
      baseUrl: 'https://app.helplocal.com.br/api',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );

  /// Reauthentication interceptor
  static void reauthenticateInterceptor() {
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {},
        onResponse: (response, handler) {},
        onError: (DioException e, handler) async {
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
    } on DioException catch (e) {
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
    } on DioException catch (e) {
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
    } on DioException catch (e) {
      print(e);
      return BaseErrorModel.fromJson(e.response?.data);
    }
  }
}
