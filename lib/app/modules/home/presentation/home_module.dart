import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:weather_app/app/app_module.dart';
import 'package:weather_app/app/core/presentation/navigation/routes.dart';
import 'package:weather_app/app/modules/home/data/datasourcers/internet_datasource.dart';
import 'package:weather_app/app/modules/home/data/datasourcers/weather_datasource.dart';
import 'package:weather_app/app/modules/home/data/drivers/internet_driver.dart';
import 'package:weather_app/app/modules/home/data/infra/weather_datasource.dart';
import 'package:weather_app/app/modules/home/data/repositories/internet_repository.dart';
import 'package:weather_app/app/modules/home/data/repositories/weather_repository.dart';
import 'package:weather_app/app/modules/home/domain/repositories/internet_repository.dart';
import 'package:weather_app/app/modules/home/domain/repositories/weather_repository.dart';
import 'package:weather_app/app/modules/home/domain/use_cases/check_internet_use_case.dart';
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
    i.addSingleton<FlutterSecureStorage>(FlutterSecureStorage.new);
    i.addSingleton<FetchCitiesWeatherUseCase>(FetchCitiesWeatherUseCaseImpl.new);
    i.addSingleton<WeatherRepository>(WeatherRepositoryImpl.new);
    i.addSingleton<WeatherDatasource>(WeatherDatasourceImpl.new);
    i.addSingleton<CheckInternetUseCase>(CheckInternetUseCaseImpl.new);
    i.addSingleton<InternetRepository>(InternetRepositoryImpl.new);
    i.addSingleton<InternetDatasource>(InternetDriver.new);
  }

  @override
  void routes(r) {
    r.child(
      Paths.root,
      child: (c) => const HomePage(),
    );
  }
}
