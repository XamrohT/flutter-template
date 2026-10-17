# Projeto Flutter

Arquitetura: Modular (rotas + DI) · MobX (estado) · UseCase/Repository · Dio atrás de `HttpService`.

## Regras
- Novo módulo: use `custom_cli_to_create_templates add module <nome_snake_case>` (veja a skill `create-module`). Não crie a estrutura manualmente.
- Fluxo: View -> Store -> UseCase -> Repository. Um use case por ação.
- Strings em `lib/l10n/*.arb`, nunca hardcoded.
- Após alterar stores: `dart run build_runner build --delete-conflicting-outputs`.
- Antes de concluir: `flutter analyze` e `flutter test`.

## Relação com custom_cli_to_create_templates
Este repositório é a **fonte da verdade** dos projetos gerados. A CLI [`custom_cli_to_create_templates`](https://github.com/XamrohT/custom_cli_to_create_templates) clona este repo a cada `custom_cli_to_create_templates create <nome>`, copia `lib/`, `test/`, `pubspec.yaml` etc. e troca o texto `flutter_backoffice_template` pelo nome do projeto e `Flutter Template`/`Template Flutter` pelo título. O que for commitado na `main` daqui vale para o próximo projeto criado.

Ao editar o template:
- Mantenha o nome do pacote `flutter_backoffice_template` (é o placeholder da CLI).
- Mantenha `lib/core/protocols/use_case.dart` e, em `lib/modules/app/app_module.dart`, a linha `List<ModularRoute> get routes => [`: o `custom_cli_to_create_templates add module` depende deles.
- `android/`, `ios/`, `web/`, `.metadata`, `pubspec.lock` e `tool/` não são copiados para projetos novos (as plataformas vêm do `flutter create`).
- Valide com `flutter analyze` e `flutter test` antes de dar push.
