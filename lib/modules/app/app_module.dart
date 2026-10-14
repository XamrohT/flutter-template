import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_backoffice_template/core/config/environment.dart';
import 'package:flutter_backoffice_template/core/http/main.dart';
import 'package:flutter_backoffice_template/modules/counter/counter_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // HttpService disponível para todos os módulos (o counter ainda não usa).
        Bind<HttpService>((i) => DioHttpService(baseUrl: Environment().config.baseUrl)),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(CounterModule.route, module: CounterModule()),
      ];
}
