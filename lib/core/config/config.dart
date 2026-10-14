import 'package:flutter_backoffice_template/core/config/base_config.dart';

/// URL pode ser injetada com `--dart-define=API_BASE_URL=...`.
abstract class _BaseEnvConfig extends BaseConfig {
  String get defaultBaseUrl;

  @override
  String get baseUrl => const String.fromEnvironment('API_BASE_URL').isNotEmpty
      ? const String.fromEnvironment('API_BASE_URL')
      : defaultBaseUrl;
}

class ProductionConfig extends _BaseEnvConfig {
  @override
  EnvironmentEnum get environment => EnvironmentEnum.production;
  @override
  String get defaultBaseUrl => 'https://api.example.com/';
}

class HomologConfig extends _BaseEnvConfig {
  @override
  EnvironmentEnum get environment => EnvironmentEnum.hml;
  @override
  String get defaultBaseUrl => 'https://api.hml.example.com/';
}

class DevelopmentConfig extends _BaseEnvConfig {
  @override
  EnvironmentEnum get environment => EnvironmentEnum.development;
  @override
  String get defaultBaseUrl => 'http://localhost:3000/';
}
