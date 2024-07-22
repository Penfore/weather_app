import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/app/modules/home/presentation/home_module.dart';

import 'core/core.dart';

class AppModule extends Module {
  @override
  void exportedBinds(i) {
    i.add<RemoteDatasource>(() => DioDatasource());
  }

  @override
  void routes(r) {
    r.module(
      Paths.home,
      module: HomeModule(),
    );
  }
}
