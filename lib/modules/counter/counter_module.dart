import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_backoffice_template/modules/counter/repositories/counter_repository.dart';
import 'package:flutter_backoffice_template/modules/counter/stores/counter_store.dart';
import 'package:flutter_backoffice_template/modules/counter/use_cases/increment_counter_use_case.dart';
import 'package:flutter_backoffice_template/modules/counter/views/counter_screen.dart';

/// Módulo de referência (mockup). Copie esta pasta para criar novas features.
/// Fluxo: View -> Store (MobX) -> UseCase -> Repository.
class CounterModule extends Module {
  static const String route = '/';

  @override
  List<Bind> get binds => [
        Bind.singleton<CounterRepository>((i) => InMemoryCounterRepository()),
        Bind.singleton((i) => IncrementCounterUseCase(i<CounterRepository>())),
        Bind.singleton((i) => CounterStore(incrementUseCase: i<IncrementCounterUseCase>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const CounterScreen()),
      ];
}
