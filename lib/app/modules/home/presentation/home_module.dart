import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/app/app_module.dart';
import 'package:weather_app/app/core/presentation/navigation/routes.dart';
import 'package:weather_app/app/modules/home/data/datasourcers/weather_datasource.dart';
import 'package:weather_app/app/modules/home/data/infra/weather_datasource.dart';
import 'package:weather_app/app/modules/home/data/repositories/weather_repository.dart';
import 'package:weather_app/app/modules/home/domain/repositories/weather_repository.dart';
import 'package:weather_app/app/modules/home/domain/use_cases/fetch_city_weather_use_case.dart';
import 'package:weather_app/app/modules/home/presentation/controllers/home_page_controller.dart';
import 'package:weather_app/app/modules/home/presentation/pages/home_page.dart';
import 'package:weather_app/app/modules/home/presentation/stores/home_store.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void binds(i) {
    i.addSingleton<HomePageController>(HomePageController.new);
    i.addSingleton<HomeStore>(HomeStore.new);
    i.addSingleton<FetchCitiesWeatherUseCase>(FetchCitiesWeatherUseCaseImpl.new);
    i.addSingleton<WeatherRepository>(WeatherRepositoryImpl.new);
    i.addSingleton<WeatherDatasource>(WeatherDatasourceImpl.new);
  }

  @override
  void routes(r) {
    r.child(
      Paths.root,
      child: (c) => const HomePage(),
    );
  }
}
