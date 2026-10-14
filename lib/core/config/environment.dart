import 'package:flutter_backoffice_template/core/config/base_config.dart';
import 'package:flutter_backoffice_template/core/config/config.dart';

class Environment {
  factory Environment() => _singleton;
  Environment._internal();
  static final Environment _singleton = Environment._internal();

  /// Troque aqui (ou use flavors) para escolher o ambiente ativo.
  static const EnvironmentEnum env = EnvironmentEnum.development;

  BaseConfig config = DevelopmentConfig();

  void initConfig(EnvironmentEnum environment) {
    config = switch (environment) {
      EnvironmentEnum.production => ProductionConfig(),
      EnvironmentEnum.hml => HomologConfig(),
      EnvironmentEnum.development => DevelopmentConfig(),
    };
  }
}
