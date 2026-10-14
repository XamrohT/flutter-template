abstract interface class CounterRepository {
  Future<int> increment();
}

/// Troque por uma implementação com HttpService quando houver API.
class InMemoryCounterRepository implements CounterRepository {
  int _value = 0;

  @override
  Future<int> increment() async => ++_value;
}
