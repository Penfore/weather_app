import 'package:weather_app/app/modules/home/domain/entities/city_entity.dart';
import 'package:weather_app/app/modules/home/domain/entities/weather_entity.dart';
import 'package:weather_app/app/modules/home/domain/form_entities/city_form_entity.dart';

abstract class WeatherRepository {
  /// Fetch the city data when passing a CityFormEntity
  Future<CityEntity> fetchCity(CityFormEntity cityForm);

  /// Fetch the weather data of a position when passing lat and lng
  Future<WeatherEntity> fetchWeather(double lat, double lng);
}
