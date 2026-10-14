# Projeto Flutter

Arquitetura: Modular (rotas + DI) · MobX (estado) · UseCase/Repository · Dio atrás de `HttpService`.

## Regras
- Novo módulo: use `custom_flutter add module <nome_snake_case>` (veja a skill `create-module`). Não crie a estrutura manualmente.
- Fluxo: View -> Store -> UseCase -> Repository. Um use case por ação.
- Strings em `lib/l10n/*.arb`, nunca hardcoded.
- Após alterar stores: `dart run build_runner build --delete-conflicting-outputs`.
- Antes de concluir: `flutter analyze` e `flutter test`.
