import 'package:flutter/material.dart';
import 'package:shopapp/core/network/local/cache_helper.dart';
import '../../config/routes/app_routes.dart';

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.loginScreen, (Route<dynamic> route) => false);
      //Navigator.pushNamed(context,Routes.registerScreen);

      //    navigateAndFinish(context, LoginScreen());
    }
  });
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String? token = '';
