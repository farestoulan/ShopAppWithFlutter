import 'package:dio/dio.dart';
import 'package:shopapp/data/web_services/products_web_servises.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/end_points.dart';

class GetProfileServices {
  final ProductsWebServices productsWebServices;

  GetProfileServices({required this.productsWebServices});

  Future<Response?> getUserData() async {
    try {
      //Response response =
      return await productsWebServices.getData(
        url: PROFILE,
        token: token,
      );
      //return response.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
