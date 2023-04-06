import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/business_logic/layout_cubit/states_layout.dart';
import 'package:shopapp/presentation/screens/categories/categories_screen.dart';
import 'package:shopapp/presentation/screens/favorites/favorites_screen.dart';
import 'package:shopapp/presentation/screens/products/products_screen.dart';
import 'package:shopapp/presentation/screens/settings/setting_screen.dart';
import 'package:shopapp/core/network/end_points.dart';
import 'package:shopapp/core/network/remot/dio_helper.dart';

import '../../core/utils/constants.dart';

import '../../models/categories_model.dart';
import '../../models/change_favorites_model.dart';
import '../../models/favorites_model.dart';
import '../../models/home_model.dart';
import '../../models/login_model.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(LayoutChangeBottomNavState());
    print('currentIndex : $currentIndex');
  }

  HomeModel homeModel;
  Map<int, bool> favorites = {};

  void getHomeData() {
    emit(LayoutLoadingHomeDataState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      // printFullText(homeModel.data.banners[0].image);
      // print(homeModel.status);

      homeModel.data.products.forEach((element) {
        favorites.addAll({element.id: element.inFavorites});
      });
      emit(LayoutSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutErrorHomeDataState());
    });
  }

  CategoriesModel categoriesModel;

  void getCategories() {
    DioHelper.getData(
      url: GET_CATEGORIES,
      token: token,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(LayoutSuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutErrorCategoriesState());
    });
  }

  ChangeFavoritesModel changeFavoritesModel;

  void changeFavorites(int productID) {
    favorites[productID] = !favorites[productID];
    emit(LayoutChangeFavoritesState());

    DioHelper.postData(
      url: FAVORITES,
      data: {
        'product_id': productID,
      },
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      print(value.data);
      if (!changeFavoritesModel.status) {
        favorites[productID] = !favorites[productID];
      } else {
        getFavorites();
      }
      emit(LayoutSuccessChangeFavoritesState(changeFavoritesModel));
    }).catchError((error) {
      favorites[productID] = !favorites[productID];
      emit(LayoutErrorChangeFavoritesState());
    });
  }

  FavoritesModel favoritesModel;
  void getFavorites() {
    emit(LayoutLoadingGetFavoritesState());
    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      emit(LayoutSuccessGetFavoritesState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutErrorGetFavoritesState());
    });
  }

  LoginModel userModel;
  void getUserData() {
    emit(LayoutLoadingUserDataState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);
      print(userModel.data.name);
      emit(LayoutSuccessUserDataState(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(LayoutErrorGetFavoritesState());
    });
  }

  void updateUserData({
    @required String name,
    @required String email,
    @required String phone,
  }) {
    emit(LayoutLoadingUpdateUserState());
    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);
      print(userModel.data.name);
      emit(LayoutSuccessUpdateUserState(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(LayoutErrorUpdateUserState());
    });
  }
}
