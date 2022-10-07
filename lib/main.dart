import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/cubit/cubit_layout.dart';
import 'package:shopapp/layout/layout_screen.dart';
import 'package:shopapp/modules/login_screen/login_screen.dart';
import 'package:shopapp/modules/on_boarding/on_boarding_screen.dart';
import 'package:shopapp/shared/bloc_observer/bloc_observer.dart';
import 'package:shopapp/shared/components/constants.dart';
import 'package:shopapp/shared/cubit/cubit.dart';
import 'package:shopapp/shared/cubit/states.dart';
import 'package:shopapp/shared/network/local/cache_helper.dart';
import 'package:shopapp/shared/network/remot/dio_helper.dart';
import 'package:shopapp/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  DioHelper.init();

  bool isDark = CacheHelper.getData(key: 'isDark');
  Widget widget;

  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
   token = CacheHelper.getData(key: 'token');

  if(onBoarding != null){
    if(token !=null) widget = LayoutScreen();
    else widget = LoginScreen();
  }else{
    widget = OnBoardingScreen();
  }



  runApp(MyApp(
    isDark: isDark,
    startWidget:widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  final Widget startWidget;

  MyApp({this.isDark, this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..changeAppMode(
              fromShared: isDark,
            ),
        ),
        BlocProvider(
          create: (BuildContext context) => LayoutCubit()..getHomeData()..getCategories() ..getFavorites(),
        ),
      ],

      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: liteTheme,
              darkTheme: darkTheme,
              themeMode: AppCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home:startWidget,
            );
          }),
    );
  }
}
