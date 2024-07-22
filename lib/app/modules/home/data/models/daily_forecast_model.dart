import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/app/modules/home/data/models/temperature_model.dart';
import 'package:weather_app/app/modules/home/data/models/weather_condition_model.dart';

part 'daily_forecast_model.g.dart';

@JsonSerializable(createToJson: false)
class DailyForecastModel {
  DailyForecastModel({
    required this.dt,
    required this.temp,
    required this.weather,
  });

  /// Forecast date
  final int dt;

  @JsonKey(name: 'temp')
  final TemperatureModel temp;

  @JsonKey(name: 'weather')
  final List<WeatherConditionModel> weather;

  factory DailyForecastModel.fromJson(Map<String, dynamic> json) => _$DailyForecastModelFromJson(json);
}
