import 'package:weather_app/app/modules/home/data/datasourcers/weather_datasource.dart';
import 'package:weather_app/app/modules/home/domain/entities/city_entity.dart';
import 'package:weather_app/app/modules/home/domain/entities/daily_forecast_entity.dart';
import 'package:weather_app/app/modules/home/domain/entities/weather_entity.dart';
import 'package:weather_app/app/modules/home/domain/form_entities/city_form_entity.dart';
import 'package:weather_app/app/modules/home/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    required this.weatherDatasource,
  });

  final WeatherDatasource weatherDatasource;

  @override
  Future<CityEntity> fetchCity(CityFormEntity cityForm) async {
    final city = await weatherDatasource.fetchCity(cityForm);

    if (city.checkIfAnyIsNull()) {
      throw Exception('One or more needed params are empty');
    }

    return CityEntity(
      name: city.name!,
      country: city.country!,
      lat: city.lat!,
      lng: city.lon!,
    );
  }

  @override
  Future<WeatherEntity> fetchWeather(double lat, double lng) async {
    final weather = await weatherDatasource.fetchWeather(lat, lng);

    if (weather.checkIfAnyIsNull()) {
      throw Exception('One or more needed params are empty');
    }

    final List<DailyForecastEntity> dailyEntities = [];
    for (final forecast in weather.daily!) {
      final forecastEntity = DailyForecastEntity(
        date: forecast.dt,
        temperature: forecast.temp.day,
        weatherCondition: forecast.weather.first.main,
      );
      dailyEntities.add(forecastEntity);
    }

    return WeatherEntity(
      currentTemperature: weather.temp!,
      currentWeatherCondition: weather.main!,
      dailyForecast: dailyEntities,
    );
  }
}
