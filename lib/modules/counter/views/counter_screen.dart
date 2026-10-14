import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_backoffice_template/generated/l10n.dart';
import 'package:flutter_backoffice_template/modules/counter/stores/counter_store.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<CounterStore>();
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).appTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.of(context).counterPushedLabel),
            Observer(
              builder: (_) => Text('${store.counter}', style: Theme.of(context).textTheme.headlineMedium),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: store.increment,
        tooltip: S.of(context).incrementTooltip,
        child: const Icon(Icons.add),
      ),
    );
  }
}
