import 'package:get_it/get_it.dart';
import 'package:jp_app_flutter/presentation/providers/splash/splash_provider.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  /// Providers
  getIt.registerFactory<SplashProvider>(() => SplashProvider());
}