import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/business_logic/search_cubit/search_cubit_state.dart';

import '../../core/utils/constants.dart';
import '../../data/models/search_model.dart';
import '../../data/web_services/products_web_servises.dart';
import '../../core/utils/end_points.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? model;

  void search(String text) {
    // emit(SearchLoadingState());
    // ProductsWebServices.postData(
    //   url: SEARCH,
    //   token: token,
    //   data: {
    //     'text': text,
    //   },
    // ).then((value) {
    //   model = SearchModel.fromJson(value.data);
    //   emit(SearchSuccessState());
    // }).catchError((error) {
    //   print(error.toString());
    //   emit(SearchErrorState());
    // });
  }
}
