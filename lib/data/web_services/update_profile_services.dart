import '../../core/network/remot/http_services.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/end_points.dart';
import 'package:http/http.dart' as http;

class UpdateProfileServices {
  final ProductsWebServices productsWebServices;

  UpdateProfileServices({required this.productsWebServices});

  Future<http.Response?> updateUserData({
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
