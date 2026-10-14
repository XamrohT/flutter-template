import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_backoffice_template/core/config/system.dart';
import 'package:flutter_backoffice_template/core/design/theme/main.dart';
import 'package:flutter_backoffice_template/core/services/navigation.dart';
import 'package:flutter_backoffice_template/generated/l10n.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setNavigatorKey(GetIt.I.get<NavigationService>().navigatorKey);

    return MaterialApp.router(
      title: 'Flutter Template',
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      debugShowCheckedModeBanner: !System().isProduction,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: DefaultTheme.light,
      darkTheme: DefaultTheme.dark,
    );
  }
}
