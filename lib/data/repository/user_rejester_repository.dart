import 'package:dio/dio.dart';
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
      Response? response = await userRejesterServices.userRegister(
          name: name, email: email, password: password, phone: phone);
      return loginModel = LoginModel.fromJson(response!.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
