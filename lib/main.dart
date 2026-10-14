import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter_backoffice_template/core/config/system.dart';
import 'package:flutter_backoffice_template/modules/app/main.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  await System().init();
  runApp(const AppCore());
}
