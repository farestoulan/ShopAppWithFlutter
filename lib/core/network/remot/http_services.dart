import 'package:http/http.dart' as http;

import '../../utils/end_points.dart';

class ProductsWebServices {
  static final ProductsWebServices _singleton = ProductsWebServices._internal();
  factory ProductsWebServices() {
    return _singleton;
  }
  ProductsWebServices._internal();

  Future<http.Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    var url1 = Uri.parse('$BASE_URL$url');
    Map<String, String> requestHeader = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };

    return await http.get(
      url1,
      headers: requestHeader,
    );
  }

  Future<http.Response> postData({
    required String url,
    // Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    var url1 = Uri.parse('$BASE_URL$url');
    // Map<String, String> requestHeader = {
    //   'Content-Type': 'application/json',
    //   'lang': lang,
    //   'Authorization': token ?? '',
    // };

    return await http.post(
      url1,
      body: data,
    );
  }

  Future<http.Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    var url1 = Uri.parse('$BASE_URL$url');
    Map<String, String> requestHeader = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };

    return await http.put(url1, body: data, headers: requestHeader);
  }
}
