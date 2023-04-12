import '../../core/network/remot/http_services.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/end_points.dart';
import '../models/categories_model.dart';
import 'package:http/http.dart' as http;

class GetCategoriesServices {
  final ProductsWebServices productsWebServices;
  CategoriesModel? categoriesModel;

  GetCategoriesServices({required this.productsWebServices});

  Future<http.Response?> getCategories() async {
    try {
      //Response? response =
      return await productsWebServices.getData(
        url: GET_CATEGORIES,
        token: token,
      );
      // return response.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
