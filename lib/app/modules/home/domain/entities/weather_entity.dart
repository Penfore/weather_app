import 'package:equatable/equatable.dart';
import 'package:weather_app/app/modules/home/domain/entities/city_entity.dart';
import 'package:weather_app/app/modules/home/domain/entities/daily_forecast_entity.dart';

// ignore: must_be_immutable
class WeatherEntity extends Equatable {
  WeatherEntity({
    this.city,
    required this.currentTemperature,
    required this.currentWeatherCondition,
    this.dailyForecast,
  });

  CityEntity? city;
  final double currentTemperature;
  final String currentWeatherCondition;
  final List<DailyForecastEntity>? dailyForecast;

  @override
  List<Object> get props => [currentTemperature, currentWeatherCondition];
}
