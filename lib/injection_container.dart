import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopapp/business_logic/layout_cubit/cubit_layout.dart';
import 'package:shopapp/business_logic/login_cubit/cubit.dart';
import 'package:shopapp/business_logic/search_cubit/search_cubit_cubit.dart';
import 'package:shopapp/data/repository/layout_repository.dart';
import 'package:shopapp/data/web_services/layout_services.dart';
import 'package:shopapp/data/web_services/login_services.dart';
import 'business_logic/register_cubit/cubit.dart';
import 'core/cubit/cubit.dart';
import 'data/repository/login_repository.dart';
import 'data/repository/user_rejester_repository.dart';
import 'data/web_services/change_favorites_services.dart';
import 'data/web_services/get_categories_services.dart';
import 'data/web_services/get_favorites_services.dart';
import 'data/web_services/get_profile_services.dart';
import 'data/web_services/products_web_servises.dart';
import 'data/web_services/update_profile_services.dart';
import 'data/web_services/user_rejester_web_services.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs

  sl.registerFactory(() => RegisterCubit(userRejesterRepository: sl()));
  sl.registerFactory(
      () => LoginCubit(loginRepository: sl(), productsWebServices: sl()));
  sl.registerFactory(() => LayoutCubit(layoutRepository: sl()));
  sl.registerFactory(() => SearchCubit());
  sl.registerFactory(() => AppCubit());

  // Repository

  sl.registerLazySingleton<UserRejesterRepository>(
      () => UserRejesterRepository(userRejesterServices: sl()));
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepository(loginServices: sl()));
  sl.registerLazySingleton<LayoutRepository>(() => LayoutRepository(
      productsWebServices: sl(),
      layoutWebServices: sl(),
      getCategoriesServices: sl(),
      getFavoritesServices: sl(),
      getProfileServices: sl(),
      changeFavoritsServices: sl(),
      updateProfileServices: sl()));

  sl.registerLazySingleton<LoginServices>(
      () => LoginServices(productsWebServices: sl()));

  sl.registerLazySingleton<ProductsWebServices>(() => ProductsWebServices());

  sl.registerLazySingleton<LayoutWebServices>(
      () => LayoutWebServices(productsWebServices: sl()));
  sl.registerLazySingleton<UserRejesterServices>(
      () => UserRejesterServices(productsWebServices: sl()));
  sl.registerLazySingleton<UpdateProfileServices>(
      () => UpdateProfileServices(productsWebServices: sl()));
  sl.registerLazySingleton<GetProfileServices>(
      () => GetProfileServices(productsWebServices: sl()));
  sl.registerLazySingleton<GetFavoritesServices>(
      () => GetFavoritesServices(productsWebServices: sl()));
  sl.registerLazySingleton<GetCategoriesServices>(
      () => GetCategoriesServices(productsWebServices: sl()));
  sl.registerLazySingleton<ChangeFavoritsServices>(
      () => ChangeFavoritsServices(productsWebServices: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  sl.registerLazySingleton(() => Dio());
}
