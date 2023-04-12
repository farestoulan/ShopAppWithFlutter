import '../../core/network/remot/http_services.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/end_points.dart';
import 'package:http/http.dart' as http;

class GetFavoritesServices {
  final ProductsWebServices productsWebServices;

  GetFavoritesServices({required this.productsWebServices});
  Future<http.Response?> getFavorites() async {
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
