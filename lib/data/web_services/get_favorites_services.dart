import 'package:dio/dio.dart';
import 'package:shopapp/data/web_services/products_web_servises.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/end_points.dart';

class GetFavoritesServices {
  final ProductsWebServices productsWebServices;

  GetFavoritesServices({required this.productsWebServices});
  Future<Response?> getFavorites() async {
    try {
      //  Response response =
      return await productsWebServices.getData(
        url: FAVORITES,
        token: token,
      );
      //  return response.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
