abstract class BaseConfig {
  EnvironmentEnum get environment;

  String get baseUrl;
}

enum EnvironmentEnum { production, hml, development }
