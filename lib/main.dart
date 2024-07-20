import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/app/app_module.dart';
import 'package:weather_app/app/app_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppPage(),
    ),
  );
}
