import 'dart:convert';

import 'package:shopapp/data/models/home_model.dart';
import '../../core/network/remot/http_services.dart';
import '../models/categories_model.dart';
import '../models/change_favorites_model.dart';
import '../models/favorites_model.dart';
import '../models/login_model.dart';
import '../web_services/change_favorites_services.dart';
import '../web_services/get_categories_services.dart';
import '../web_services/get_favorites_services.dart';
import '../web_services/get_profile_services.dart';
import '../web_services/layout_services.dart';
import '../web_services/update_profile_services.dart';

class LayoutRepository {
  final ProductsWebServices productsWebServices;
  final LayoutWebServices layoutWebServices;
  final GetCategoriesServices getCategoriesServices;
  final GetFavoritesServices getFavoritesServices;
  final GetProfileServices getProfileServices;
  final ChangeFavoritsServices changeFavoritsServices;
  final UpdateProfileServices updateProfileServices;
  HomeModel? homeModel;
  CategoriesModel? categoriesModel;
  FavoritesModel? favoritesModel;
  LoginModel? userModel;
  ChangeFavoritesModel? changeFavoritesModel;

  LayoutRepository(
      {required this.productsWebServices,
      required this.layoutWebServices,
      required this.getCategoriesServices,
      required this.getFavoritesServices,
      required this.getProfileServices,
      required this.changeFavoritsServices,
      required this.updateProfileServices});

  Future<ChangeFavoritesModel?> changeFavorites(
      {required int productID}) async {
    try {
      var response =
          await changeFavoritsServices.changeFavorites(productID: productID);
      Map<String, dynamic> valueMap = json.decode(response!.body);
      return changeFavoritesModel = ChangeFavoritesModel.fromJson(valueMap);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<FavoritesModel?> getFavorites() async {
    try {
      var response = await getFavoritesServices.getFavorites();
      Map<String, dynamic> valueMap = json.decode(response!.body);
      return favoritesModel = FavoritesModel.fromJson(valueMap);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<LoginModel?> getUserData() async {
    try {
      var response = await getProfileServices.getUserData();
      Map<String, dynamic> valueMap = json.decode(response!.body);
      return userModel = LoginModel.fromJson(valueMap);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<HomeModel?> getHomeData() async {
    try {
      var response = await layoutWebServices.getHomeData();
      Map<String, dynamic> valueMap = json.decode(response!.body);
      return homeModel = HomeModel.fromJson(valueMap);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<CategoriesModel?> getCategories() async {
    try {
      var response = await getCategoriesServices.getCategories();
      Map<String, dynamic> valueMap = json.decode(response!.body);
      return categoriesModel = CategoriesModel.fromJson(valueMap);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<LoginModel?> updateUserData({
    required String name,
    required String email,
    required String phone,
  }) async {
    try {
      var response = await updateProfileServices.updateUserData(
          name: name, email: email, phone: phone);
      Map<String, dynamic> valueMap = json.decode(response!.body);

      return userModel = LoginModel.fromJson(valueMap);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
