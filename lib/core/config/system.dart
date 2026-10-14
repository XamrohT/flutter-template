import 'package:get_it/get_it.dart';
import 'package:flutter_backoffice_template/core/config/base_config.dart';
import 'package:flutter_backoffice_template/core/config/environment.dart';
import 'package:flutter_backoffice_template/core/services/navigation.dart';

class System {
  static final System _instance = System._internal();
  factory System() => _instance;
  System._internal();

  bool isReady = false;

  bool get isProduction => Environment.env == EnvironmentEnum.production;

  Future<void> init() async {
    if (!GetIt.I.isRegistered<NavigationService>()) {
      GetIt.I.registerLazySingleton(() => NavigationService());
    }
    if (isReady) return;
    Environment().initConfig(Environment.env);
    isReady = true;
  }
}
