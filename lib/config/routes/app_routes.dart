import 'package:flutter/material.dart';
import 'package:shopapp/presentation/screens/layout/layout_screen.dart';
import 'package:shopapp/presentation/screens/login_screen/login_screen.dart';
import 'package:shopapp/presentation/screens/register_screen/register_Screen.dart';

import '../../core/network/local/cache_helper.dart';
import '../../core/utils/constants.dart';
import '../../presentation/screens/on_boarding/on_boarding_screen.dart';

class Routes {
  static const String initialRoute = '/';

  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String layoutScreen = '/layoutScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
    token = CacheHelper.getData(key: 'token');
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {
          if (onBoarding != null) {
            if (token != null)
              return LayoutScreen();
            else
              return LoginScreen();
          } else {
            return OnBoardingScreen();
          }
        });
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) {
          return LoginScreen();
        });
      case Routes.layoutScreen:
        return MaterialPageRoute(builder: (context) {
          return LayoutScreen();
        });

      case Routes.registerScreen:
        return MaterialPageRoute(builder: (context) {
          return RegisterScreen();
        });
      case Routes.layoutScreen:
        return MaterialPageRoute(builder: (context) {
          return LayoutScreen();
        });

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text('noRouteFound'),
              ),
            )));
  }
}
