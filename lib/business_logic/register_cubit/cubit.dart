import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/business_logic/register_cubit/states.dart';
import '../../data/models/login_model.dart';
import '../../data/repository/user_rejester_repository.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  final UserRejesterRepository userRejesterRepository;
  RegisterCubit({required this.userRejesterRepository})
      : super(RegisterInitialState());
  LoginModel? loginModel;

  static RegisterCubit get(context) => BlocProvider.of(context);

  // void userRegister(
  //     {String name,
  //     @required String email,
  //     @required String password,
  //     String phone}) {
  //   emit(RegisterLoadingState());
  //   ProductsWebServices.postData(url: REGISTER, data: {
  //     'name': name,
  //     'email': email,
  //     'password': password,
  //     'phone': phone,
  //   }
  //   ).then((value) {
  //     loginModel = LoginModel.fromJson(value.data);
  //     print(value.data);
  //     emit(RegisterSuccessState(loginModel));
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(RegisterErrorState(error.toString()));
  //   });
  // }
  void userRegister(
      {String? name,
      required String email,
      required String password,
      String? phone}) {
    emit(RegisterLoadingState());
    userRejesterRepository
        .userRegister(
            name: name!, email: email, password: password, phone: phone!)
        .then((loginModel) {
      emit(RegisterSuccessState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeRegisterPasswordVisibilityState());
  }
}
