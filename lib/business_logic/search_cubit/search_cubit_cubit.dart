import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/business_logic/search_cubit/search_cubit_state.dart';
import '../../core/network/end_points.dart';
import '../../core/network/remot/dio_helper.dart';
import '../../core/utils/constants.dart';
import '../../models/search_model.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel model;

  void search(String text) {
    emit(SearchLoadingState());
    DioHelper.postData(
      url: SEARCH,
      token: token,
      data: {
        'text': text,
      },
    ).then((value) {
      model = SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}
