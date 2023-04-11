import 'package:dio/dio.dart';
import 'package:shopapp/data/web_services/products_web_servises.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/end_points.dart';

class LoginServices {
  final ProductsWebServices productsWebServices;

  LoginServices({required this.productsWebServices});

  Future<Response?> getUserData() async {
    try {
      //  Response response =
      return await productsWebServices.getData(
        url: PROFILE,
        token: token,
      );
      //    return response.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<Response?> userLogin(
      {required String email, required String password}) async {
    try {
      //  Response response =
      return await productsWebServices.postData(
        url: LOGIN,
        data: {
          'email': email,
          'password': password,
        },
      );
      //   return response.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
