import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/business_logic/login_cubit/states.dart';
import '../../data/models/login_model.dart';
import '../../data/repository/login_repository.dart';
import '../../data/web_services/products_web_servises.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginRepository loginRepository;
  final ProductsWebServices productsWebServices;
  LoginModel? loginModel;
  LoginCubit({required this.loginRepository, required this.productsWebServices})
      : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  // void userLogin({required String email, required String password}) {
  //   emit(LoginLoadingState());
  //   if (productsWebServices != null)
  //     productsWebServices.postData(url: LOGIN, data: {
  //       'email': email,
  //       'password': password,
  //     }).then((value) {
  //       loginModel = LoginModel.fromJson(value.data);
  //       print(value.data);
  //       emit(LoginSuccessState(loginModel!));
  //     }).catchError((error) {
  //       print(error.toString());
  //       emit(LoginErrorState(error.toString()));
  //     });
  // }

  void userLogin({required String email, required String password}) {
    emit(LoginLoadingState());

    loginRepository.userLogin(email: email, password: password).then((value) {
      loginModel = value;
      print(value!.data);
      emit(LoginSuccessState(value));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
