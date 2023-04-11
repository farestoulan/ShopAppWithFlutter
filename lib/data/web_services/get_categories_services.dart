import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/data/web_services/products_web_servises.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/end_points.dart';
import '../models/categories_model.dart';

class GetCategoriesServices {
  final ProductsWebServices productsWebServices;
  CategoriesModel? categoriesModel;

  GetCategoriesServices({required this.productsWebServices});

  Future<Response?> getCategories() async {
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
