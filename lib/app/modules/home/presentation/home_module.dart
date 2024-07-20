import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/app/app_module.dart';
import 'package:weather_app/app/core/presentation/navigation/routes.dart';
import 'package:weather_app/app/modules/home/presentation/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      Paths.root,
      child: (c) => const HomePage(),
    );
  }
}
