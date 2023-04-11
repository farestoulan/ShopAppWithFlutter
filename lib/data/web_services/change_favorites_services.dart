import 'package:dio/dio.dart';
import 'package:shopapp/data/web_services/products_web_servises.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/end_points.dart';

class ChangeFavoritsServices {
  ProductsWebServices productsWebServices;

  ChangeFavoritsServices({required this.productsWebServices});

  Future<Response?> changeFavorites({required int productID}) async {
    try {
      //  Response response  =
      return await productsWebServices.postData(
        url: FAVORITES,
        data: {
          'product_id': productID,
        },
        token: token,
      );
      //  return response.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
