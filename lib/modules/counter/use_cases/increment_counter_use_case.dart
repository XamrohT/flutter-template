import 'package:flutter_backoffice_template/core/protocols/use_case.dart';
import 'package:flutter_backoffice_template/modules/counter/repositories/counter_repository.dart';

class IncrementCounterUseCase implements UseCase<int, void> {
  final CounterRepository _repository;

  IncrementCounterUseCase(this._repository);

  @override
  Future<int> execute(void params) => _repository.increment();
}
