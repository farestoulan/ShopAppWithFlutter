import 'package:dio/dio.dart';
import 'package:shopapp/data/web_services/products_web_servises.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/end_points.dart';

class UpdateProfileServices {
  final ProductsWebServices productsWebServices;

  UpdateProfileServices({required this.productsWebServices});

  Future<Response?> updateUserData({
    required String name,
    required String email,
    required String phone,
  }) async {
    try {
      //  Response response =
      return await productsWebServices.putData(
        url: UPDATE_PROFILE,
        token: token,
        data: {
          'name': name,
          'email': email,
          'phone': phone,
        },
      );
      // return response.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
