import 'package:weather_app/app/core/presentation/controllers/page_life_cycle_controller.dart';
import 'package:weather_app/app/modules/home/domain/entities/weather_entity.dart';
import 'package:weather_app/app/modules/home/domain/use_cases/fetch_city_weather_use_case.dart';
import 'package:weather_app/app/modules/home/presentation/stores/home_store.dart';
import 'package:weather_app/app/modules/home/presentation/widgets/city_card.dart';

class HomePageController extends PageLifeCycleController {
  HomePageController({
    required this.fetchCityWeatherUseCase,
    required this.store,
  });

  final FetchCitiesWeatherUseCase fetchCityWeatherUseCase;

  @override
  final HomeStore store;

  @override
  Future<void> onReady() async {
    fetchWeatherList();
  }

  Future<void> fetchWeatherList() async {
    try {
      store.loading();
      store.weatherData = await fetchCityWeatherUseCase.call(citiesForms: store.cities);
      for (WeatherEntity weather in store.weatherData) {
        final card = CityCard(
          cityName: weather.city!.name,
          countryName: weather.city!.country,
          currentTemperature: weather.currentTemperature,
          currentWeatherCondition: weather.currentWeatherCondition,
        );
        store.cityCards.add(card);
      }
      store.completed();
    } on Exception catch (e) {
      store.error = e;
    }
  }
}
