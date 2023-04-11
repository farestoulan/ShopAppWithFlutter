import 'package:dio/dio.dart';
import 'package:shopapp/data/models/home_model.dart';

import '../models/categories_model.dart';
import '../models/change_favorites_model.dart';
import '../models/favorites_model.dart';
import '../models/login_model.dart';
import '../web_services/change_favorites_services.dart';
import '../web_services/get_categories_services.dart';
import '../web_services/get_favorites_services.dart';
import '../web_services/get_profile_services.dart';
import '../web_services/layout_services.dart';
import '../web_services/products_web_servises.dart';
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
      Response? response =
          await changeFavoritsServices.changeFavorites(productID: productID);
      return changeFavoritesModel =
          ChangeFavoritesModel.fromJson(response!.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<FavoritesModel?> getFavorites() async {
    try {
      Response? response = await getFavoritesServices.getFavorites();
      return favoritesModel = FavoritesModel.fromJson(response!.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<LoginModel?> getUserData() async {
    try {
      Response? response = await getProfileServices.getUserData();
      return userModel = LoginModel.fromJson(response!.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<HomeModel?> getHomeData() async {
    try {
      Response? response = await layoutWebServices.getHomeData();
      return homeModel = HomeModel.fromJson(response!.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<CategoriesModel?> getCategories() async {
    try {
      Response? response = await getCategoriesServices.getCategories();
      return categoriesModel = CategoriesModel.fromJson(response!.data);
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
      Response? response = await updateProfileServices.updateUserData(
          name: name, email: email, phone: phone);

      return userModel = LoginModel.fromJson(response!.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
