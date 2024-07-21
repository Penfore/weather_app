import 'package:equatable/equatable.dart';
import 'package:weather_app/app/modules/home/domain/entities/city_entity.dart';
import 'package:weather_app/app/modules/home/domain/entities/daily_forecast_entity.dart';

class WeatherEntity extends Equatable {
  const WeatherEntity({
    this.city,
    required this.currentTemperature,
    required this.currentWeatherCondition,
    this.dailyForecast,
  });

  final CityEntity? city;
  final double currentTemperature;
  final String currentWeatherCondition;
  final List<DailyForecastEntity>? dailyForecast;

  set city(CityEntity? city) => this.city = city;

  @override
  List<Object> get props => [currentTemperature, currentWeatherCondition];
}
