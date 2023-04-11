import 'package:dio/dio.dart';
import '../models/login_model.dart';
import '../web_services/login_services.dart';

class LoginRepository {
  final LoginServices loginServices;
  LoginModel? loginModel;
  LoginRepository({required this.loginServices});

  Future<LoginModel?> userLogin(
      {required String email, required String password}) async {
    try {
      Response? response =
          await loginServices.userLogin(email: email, password: password);
      return loginModel = LoginModel.fromJson(response!.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
