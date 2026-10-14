# Flutter Template

Counter app padrão do Flutter, só que já estruturado com a nossa arquitetura. Sem auth, sem assets, sem design system: apenas a base.

## O que vem
- **Modular**: rotas e DI por módulo (`modules/<feature>/<feature>_module.dart`).
- **MobX**: estado (stores com codegen).
- **UseCase / Repository**: `View -> Store -> UseCase -> Repository`.
- **Dio** atrás da interface `HttpService`, com erros tipados e mensagens i18n.
- **Config por ambiente** (`production`, `hml`, `development`) + `--dart-define=API_BASE_URL`.
- **Tema** Material 3 a partir de uma cor semente (`core/design/theme/palette.dart`), claro e escuro.
- **i18n** pt_BR/en via intl_utils.

## Começando
```bash
python tool/rename_project.py meu_app "Meu App" br.com.empresa
flutter pub get
flutter pub run intl_utils:generate
dart run build_runner build --delete-conflicting-outputs
flutter run -d chrome
```

## Estrutura
```
lib/
  core/
    config/      ambientes + System.init()
    http/        HttpService, DioHttpService, DioInterceptor, HttpError
    protocols/   UseCase<T, Params>
    services/    NavigationService + helpers de navegação
    design/theme Palette + DefaultTheme
  modules/
    app/         AppModule (HttpService global), AppWidget
    counter/     módulo de referência (mockup): repository, use case, store, view
  l10n/          .arb
```

## Nova feature
Copie `modules/counter`, renomeie, registre um `ModuleRoute` em `modules/app/app_module.dart`, troque o repository em memória por um com `HttpService`. O módulo `counter` pode ser apagado quando não servir mais de referência.

## Antes de commitar
```bash
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
```
