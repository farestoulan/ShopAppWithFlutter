import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/business_logic/layout_cubit/cubit_layout.dart';
import 'package:shopapp/presentation/screens/layout/layout_screen.dart';
import 'package:shopapp/presentation/screens/login_screen/login_screen.dart';
import 'package:shopapp/presentation/screens/on_boarding/on_boarding_screen.dart';
import 'package:shopapp/core/bloc_observer/bloc_observer.dart';
import 'package:shopapp/core/cubit/cubit.dart';
import 'package:shopapp/core/cubit/states.dart';
import 'package:shopapp/core/network/local/cache_helper.dart';
import 'business_logic/login_cubit/cubit.dart';
import 'business_logic/register_cubit/cubit.dart';
import 'config/routes/app_routes.dart';
import 'core/utils/constants.dart';
import 'core/utils/styles/themes.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');
  Widget widget;

  // bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  // token = CacheHelper.getData(key: 'token');

  // if (onBoarding != null) {
  //   if (token != null)
  //     widget = LayoutScreen();
  //   else
  //     widget = LoginScreen();
  // } else {
  //   widget = OnBoardingScreen();
  // }

  runApp(MyApp(
    isDark: isDark,
    //startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  // final Widget? startWidget;

  MyApp({
    this.isDark,
    //this.startWidget
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => di.sl<AppCubit>()
            ..changeAppMode(
              fromShared: isDark,
            ),
        ),
        BlocProvider(
          create: (BuildContext context) => di.sl<LayoutCubit>()
            ..getHomeData()
            ..getCategories()
            ..getFavorites()
            ..getUserData(),
        ),
        BlocProvider(
          create: (BuildContext context) => di.sl<RegisterCubit>(),
        ),
        BlocProvider(
          create: (BuildContext context) => di.sl<LoginCubit>(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRoutes.onGenerateRoute,
              theme: liteTheme,
              darkTheme: darkTheme,
              themeMode: AppCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              //  home: startWidget,
            );
          }),
    );
  }
}
