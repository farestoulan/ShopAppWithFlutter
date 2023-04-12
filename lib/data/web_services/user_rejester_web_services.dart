import '../../core/network/remot/http_services.dart';
import '../../core/utils/end_points.dart';
import 'package:http/http.dart' as http;

class UserRejesterServices {
  final ProductsWebServices productsWebServices;

  UserRejesterServices({required this.productsWebServices});

  Future<http.Response?> userRegister(
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
