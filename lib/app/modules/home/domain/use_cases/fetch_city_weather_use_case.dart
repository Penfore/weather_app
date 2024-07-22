import 'package:weather_app/app/modules/home/domain/entities/city_entity.dart';
import 'package:weather_app/app/modules/home/domain/entities/weather_entity.dart';
import 'package:weather_app/app/modules/home/domain/form_entities/city_form_entity.dart';
import 'package:weather_app/app/modules/home/domain/repositories/weather_repository.dart';

abstract class FetchCitiesWeatherUseCase {
  Future<List<WeatherEntity>> call({required List<CityFormEntity> citiesForms});
}

class FetchCitiesWeatherUseCaseImpl implements FetchCitiesWeatherUseCase {
  FetchCitiesWeatherUseCaseImpl({
    required this.repository,
  });

  final WeatherRepository repository;

  @override
  Future<List<WeatherEntity>> call({required List<CityFormEntity> citiesForms}) async {
    final List<CityEntity> citiesData = [];
    for (CityFormEntity cityForm in citiesForms) {
      citiesData.add(await repository.fetchCity(cityForm));
    }

    final List<WeatherEntity> weatherData = [];
    for (CityEntity city in citiesData) {
      final weather = await repository.fetchWeather(city.lat, city.lng);
      weather.city = city;
      weatherData.add(weather);
    }

    return weatherData;
  }
}
