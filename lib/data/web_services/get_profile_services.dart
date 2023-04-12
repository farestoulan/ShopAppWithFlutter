import '../../core/network/remot/http_services.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/end_points.dart';
import 'package:http/http.dart' as http;

class GetProfileServices {
  final ProductsWebServices productsWebServices;

  GetProfileServices({required this.productsWebServices});

  Future<http.Response?> getUserData() async {
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
