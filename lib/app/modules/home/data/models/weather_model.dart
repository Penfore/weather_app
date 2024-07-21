import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/app/modules/home/data/models/daily_forecast_model.dart';

part 'weather_model.g.dart';

@JsonSerializable(createToJson: false)
class WeatherModel {
  WeatherModel({
    this.lat,
    this.lon,
    this.temp,
    this.main,
    this.daily,
  });

  final double? lat;
  final double? lon;
  final double? temp;

  /// Current weather condition
  final String? main;
  @JsonKey(name: 'daily')
  final List<DailyForecastModel>? daily;

  bool checkIfAnyIsNull() {
    return [lat, lon, temp, main].contains(null) || (daily?.isEmpty ?? true);
  }

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
}
