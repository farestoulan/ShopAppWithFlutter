import 'dart:convert';

import '../models/login_model.dart';
import '../web_services/user_rejester_web_services.dart';

class UserRejesterRepository {
  final UserRejesterServices userRejesterServices;
  LoginModel? loginModel;
  UserRejesterRepository({required this.userRejesterServices});

  Future<LoginModel?> userRegister(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    try {
      var response = await userRejesterServices.userRegister(
          name: name, email: email, password: password, phone: phone);
      Map<String, dynamic> valueMap = json.decode(response!.body);
      return loginModel = LoginModel.fromJson(valueMap);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
