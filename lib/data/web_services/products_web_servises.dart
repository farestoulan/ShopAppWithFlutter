import 'package:dio/dio.dart';

class ProductsWebServices {
  static final ProductsWebServices _singleton = ProductsWebServices._internal();
  factory ProductsWebServices() {
    return _singleton;
  }
  ProductsWebServices._internal();
  static var dio = Dio()
    ..options.baseUrl = 'https://student.valuxapps.com/api/'
    ..options.receiveDataWhenStatusError = true;
  // ..options.connectTimeout = 90 * 1000
  // ..options.receiveTimeout = 90 * 1000;

  // init() {
  //   dio = Dio(
  //     BaseOptions(
  //       baseUrl: 'https://student.valuxapps.com/api/',
  //       receiveDataWhenStatusError: true,
  //     ),
  //   );
  // }

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await dio.get(url, queryParameters: query ?? null);
  }

  Future<Response> postData({
    required String? url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String? lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };

    return await dio.post(
      url!,
      queryParameters: query,
      data: data,
    );
  }

  Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };

    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
