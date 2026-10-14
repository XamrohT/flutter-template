import 'package:mobx/mobx.dart';
import 'package:flutter_backoffice_template/modules/counter/use_cases/increment_counter_use_case.dart';

part 'counter_store.g.dart';

class CounterStore = CounterStoreBase with _$CounterStore;

abstract class CounterStoreBase with Store {
  final IncrementCounterUseCase _incrementUseCase;

  CounterStoreBase({required IncrementCounterUseCase incrementUseCase}) : _incrementUseCase = incrementUseCase;

  @observable
  int counter = 0;

  @action
  Future<void> increment() async => counter = await _incrementUseCase.execute(null);
}
