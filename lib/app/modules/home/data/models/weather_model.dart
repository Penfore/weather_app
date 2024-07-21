import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/app/modules/home/data/models/daily_forecast_model.dart';

part 'weather_model.g.dart';

@JsonSerializable(createToJson: false)
class WeatherModel {
  WeatherModel({
    this.lat,
    this.lon,
    this.current,
    this.daily,
  });

  final double? lat;
  final double? lon;
  final Current? current;
  @JsonKey(name: 'daily')
  final List<DailyForecastModel>? daily;

  bool checkIfAnyIsNull() {
    return [lat, lon, current].contains(null) || (daily?.isEmpty ?? true);
  }

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class Current {
  Current({
    required this.temp,
    required this.weather,
  });

  final double temp;
  final List<Weather> weather;

  factory Current.fromJson(Map<String, dynamic> json) => _$CurrentFromJson(json);
}

@JsonSerializable(createToJson: false)
class Weather {
  Weather({
    required this.main,
  });

  /// Current weather condition
  final String main;

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}
