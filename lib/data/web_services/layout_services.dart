import 'package:dio/dio.dart';
import 'package:shopapp/data/web_services/products_web_servises.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/end_points.dart';

class LayoutWebServices {
  ProductsWebServices productsWebServices;

  LayoutWebServices({required this.productsWebServices});

  Future<Response?> getHomeData() async {
    try {
      //  Response response =
      return await productsWebServices.getData(
        url: HOME,
        token: token,
      );
      // return response.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
