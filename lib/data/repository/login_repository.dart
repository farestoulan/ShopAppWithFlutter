import 'dart:convert';

import '../models/login_model.dart';
import '../web_services/login_services.dart';

class LoginRepository {
  final LoginServices loginServices;
  LoginModel? loginModel;
  LoginRepository({required this.loginServices});

  Future<LoginModel?> userLogin(
      {required String email, required String password}) async {
    try {
      var response =
          await loginServices.userLogin(email: email, password: password);
      Map<String, dynamic> valueMap = json.decode(response!.body);
      return loginModel = LoginModel.fromJson(valueMap);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
