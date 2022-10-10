import 'package:shopapp/models/change_favorites_model.dart';
import 'package:shopapp/models/login_model.dart';

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

class LayoutLoadingUserDataState extends LayoutStates {}

class LayoutSuccessUserDataState extends LayoutStates {
  final LoginModel loginModel;

  LayoutSuccessUserDataState(this.loginModel);
}

class LayoutErrorUserDataState extends LayoutStates {}


class LayoutLoadingUpdateUserState extends LayoutStates {}

class LayoutSuccessUpdateUserState extends LayoutStates {
  final LoginModel loginModel;

  LayoutSuccessUpdateUserState(this.loginModel);
}

class LayoutErrorUpdateUserState extends LayoutStates {}
