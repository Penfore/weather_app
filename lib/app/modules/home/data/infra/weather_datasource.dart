import 'package:weather_app/app/core/core.dart';
import 'package:weather_app/app/modules/home/data/datasourcers/weather_datasource.dart';
import 'package:weather_app/app/modules/home/data/models/city_model.dart';
import 'package:weather_app/app/modules/home/data/models/weather_model.dart';
import 'package:weather_app/app/modules/home/domain/form_entities/city_form_entity.dart';

class WeatherDatasourceImpl implements WeatherDatasource {
  WeatherDatasourceImpl({
    required this.remoteDatasource,
  });

  final RemoteDatasource remoteDatasource;

  final apiKey = const String.fromEnvironment('API_KEY');

  @override
  Future<CityModel> fetchCity(CityFormEntity cityForm) async {
    final List<dynamic> response = await remoteDatasource.get(
      url: 'http://api.openweathermap.org/geo/1.0/direct',
      query: {
        'q': [cityForm.nameController.text, '{}', cityForm.countryNameController.text],
        'limit': 1,
        'appid': apiKey,
      },
    );

    return CityModel.fromJson(response.first);
  }

  @override
  Future<WeatherModel> fetchWeather(double lat, double lng) async {
    try {
      final response = await remoteDatasource.get(
        url: 'https://api.openweathermap.org/data/3.0/onecall',
        query: {
          'lat': lat,
          'lon': lng,
          'exclude': ['minutely', 'hourly', 'alerts'],
          'units': 'metric',
          'appid': apiKey,
        },
      );

      return WeatherModel.fromJson(response);
    } catch (e) {
      throw Exception('Error ocurred while fetching weather data');
    }
  }
}
