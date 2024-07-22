import 'dart:convert';

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

  factory WeatherEntity.fromJson(Map<String, dynamic> json) => WeatherEntity(
        city: CityEntity.fromJson(json['city']),
        currentTemperature: json['currentTemperature'],
        currentWeatherCondition: json['currentWeatherCondition'],
        dailyForecast: json['dailyForecast'].map<DailyForecastEntity>((j) => DailyForecastEntity.fromJson(j)).toList(),
      );

  static Map<String, dynamic> toJson(WeatherEntity entity) => <String, dynamic>{
        'city': CityEntity.toJson(entity.city!),
        'currentTemperature': entity.currentTemperature,
        'currentWeatherCondition': entity.currentWeatherCondition,
        'dailyForecast': entity.dailyForecast!
            .map(
              (e) => DailyForecastEntity.toJson(e),
            )
            .toList(),
      };

  static String serialize(WeatherEntity entity) => jsonEncode(WeatherEntity.toJson(entity));
  static WeatherEntity deserialize(String json) => WeatherEntity.fromJson(jsonDecode(json));
}
