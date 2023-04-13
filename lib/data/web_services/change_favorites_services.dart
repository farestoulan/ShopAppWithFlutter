import '../../core/network/remot/http_services.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/end_points.dart';
import 'package:http/http.dart' as http;

class ChangeFavoritsServices {
  final ProductsWebServices productsWebServices;

  ChangeFavoritsServices({required this.productsWebServices});

  Future<http.Response?> changeFavorites({required int productID}) async {
    try {
      //  Response response  =
      return await productsWebServices.postData(
          url: FAVORITES,
          data: {
            'product_id': productID.toString(),
          },
          token: token,
          lang: 'ar');
      //  return response.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
