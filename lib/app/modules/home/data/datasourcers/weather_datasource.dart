import 'package:weather_app/app/modules/home/data/models/city_model.dart';
import 'package:weather_app/app/modules/home/data/models/weather_model.dart';
import 'package:weather_app/app/modules/home/domain/form_entities/city_form_entity.dart';

abstract class WeatherDatasource {
  Future<CityModel> fetchCity(CityFormEntity cityForm);
  Future<WeatherModel> fetchWeather(double lat, double lng);
}
