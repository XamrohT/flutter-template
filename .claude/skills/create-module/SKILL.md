---
name: create-module
description: Use when creating a new feature/module in this Flutter project. Runs the custom_flutter CLI to scaffold the module and register its route, instead of writing the boilerplate by hand.
---

# Criar módulo

Para qualquer feature nova, **não escreva o boilerplate à mão**. Rode na raiz do projeto:

```bash
custom_flutter add module <nome_snake_case>
```

Exemplo: `custom_flutter add module pedidos`.

O comando:
- cria `lib/modules/<nome>/` com `<nome>_module.dart`, `repositories/`, `use_cases/`, `stores/` (MobX) e `views/`;
- registra `ModuleRoute(<Nome>Module.route, ...)` em `lib/modules/app/app_module.dart`;
- roda `build_runner` para gerar o `.g.dart` da store.

## Depois de gerar

Edite os arquivos criados, não recrie:
1. **Repository**: troque `InMemory<Nome>Repository` por uma implementação com `HttpService` (injetado pelo `AppModule`).
2. **Use case**: um por ação, implementando `UseCase<T, Params>` (`lib/core/protocols/use_case.dart`).
3. **Store**: estado com `@observable`/`@action`; rode `dart run build_runner build --delete-conflicting-outputs` após mudar.
4. **View**: consome a store via `Modular.get` e `Observer`.
5. Textos novos vão em `lib/l10n/*.arb`; depois `flutter pub run intl_utils:generate`.

Fluxo: View -> Store -> UseCase -> Repository.

## Se o comando não existir

Se `custom_flutter` não estiver no PATH, avise o usuário em vez de escrever o módulo manualmente. Instalação: `dart pub global activate --source git https://github.com/XamrohT/custom_flutter.git`.
