import 'package:get_it/get_it.dart';
import 'package:jp_app_flutter/core/constants/routes_constants.dart';
import 'package:jp_app_flutter/data/api/cities_api.dart';
import 'package:jp_app_flutter/data/api/user_api.dart';
import 'package:jp_app_flutter/data/datasource/cities/cities_local_data_source.dart';
import 'package:jp_app_flutter/data/datasource/user/user_local_data_source.dart';
import 'package:jp_app_flutter/data/repositories/cities/cities_repository_imp.dart';
import 'package:jp_app_flutter/data/repositories/user/user_repository_imp.dart';
import 'package:jp_app_flutter/domain/repositories/cities/cities_repository.dart';
import 'package:jp_app_flutter/domain/repositories/user/user_repository.dart';
import 'package:jp_app_flutter/domain/use_cases/cities/get_cities_use_case.dart';
import 'package:jp_app_flutter/domain/use_cases/login/login_user_use_case.dart';
import 'package:jp_app_flutter/presentation/providers/cities/cities_provider.dart';
import 'package:jp_app_flutter/presentation/providers/login/login_provider.dart';
import 'package:jp_app_flutter/presentation/providers/splash/splash_provider.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  /// Api
  getIt.registerFactory<UserApi>(() => UserApi(url: kDataUsers));
  getIt.registerFactory<CitiesApi>(() => CitiesApi(url: kDataCities));
  /// DataSource
  getIt.registerFactory<UserLocalDataSource>(() => IUserLocalDataSource());
  getIt.registerFactory<CitiesLocalDataSource>(() => ICitiesLocalDataSource());
  /// Repositories
  getIt.registerLazySingleton<UserRepository>(() => IUserRepository());
  getIt.registerLazySingleton<CitiesRepository>(() => ICitiesRepository());
  /// Use Cases
  getIt.registerLazySingleton<LoginUserUseCase>(() => ILoginUserUseCase());
  getIt.registerLazySingleton<GetCitiesUseCase>(() => IGetCitiesUseCase());
  /// Providers
  getIt.registerFactory<SplashProvider>(() => SplashProvider());
  getIt.registerFactory<LoginProvider>(() => LoginProvider());
  getIt.registerFactory<CitiesProvider>(() => CitiesProvider());
}