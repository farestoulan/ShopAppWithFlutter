import 'package:shopapp/models/change_favorites_model.dart';

abstract class LayoutStates {}

class LayoutInitialState extends LayoutStates {}

class LayoutChangeBottomNavState extends LayoutStates {}

class LayoutLoadingHomeDataState extends LayoutStates {}

class LayoutSuccessHomeDataState extends LayoutStates {}

class LayoutErrorHomeDataState extends LayoutStates {}

class LayoutSuccessCategoriesState extends LayoutStates {}

class LayoutErrorCategoriesState extends LayoutStates {}

class LayoutChangeFavoritesState extends LayoutStates {}

class LayoutSuccessChangeFavoritesState extends LayoutStates {
  final ChangeFavoritesModel model;

  LayoutSuccessChangeFavoritesState(this.model);
}

class LayoutErrorChangeFavoritesState extends LayoutStates {}

class LayoutLoadingGetFavoritesState extends LayoutStates {}

class LayoutSuccessGetFavoritesState extends LayoutStates {}

class LayoutErrorGetFavoritesState extends LayoutStates {}
