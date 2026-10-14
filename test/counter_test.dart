import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_backoffice_template/modules/counter/repositories/counter_repository.dart';
import 'package:flutter_backoffice_template/modules/counter/stores/counter_store.dart';
import 'package:flutter_backoffice_template/modules/counter/use_cases/increment_counter_use_case.dart';

void main() {
  test('store incrementa via use case', () async {
    final store = CounterStore(incrementUseCase: IncrementCounterUseCase(InMemoryCounterRepository()));
    await store.increment();
    await store.increment();
    expect(store.counter, 2);
  });
}
