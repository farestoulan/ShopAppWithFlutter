import 'package:dio/dio.dart';
import 'package:shopapp/data/web_services/products_web_servises.dart';

import '../../core/utils/end_points.dart';

class UserRejesterServices {
  final ProductsWebServices productsWebServices;

  UserRejesterServices({required this.productsWebServices});

  Future<Response?> userRegister(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    try {
      //  Response response =
      return await productsWebServices.postData(url: REGISTER, data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      });
      // return response.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
