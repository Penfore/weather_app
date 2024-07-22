import 'dart:convert';

import 'package:equatable/equatable.dart';

class DailyForecastEntity extends Equatable {
  const DailyForecastEntity({
    required this.date,
    required this.temperature,
    required this.weatherCondition,
  });

  final DateTime date;
  final double temperature;
  final String weatherCondition;

  @override
  List<Object> get props => [date, temperature, weatherCondition];

  factory DailyForecastEntity.fromJson(Map<String, dynamic> json) => DailyForecastEntity(
        date: DateTime.parse(json['date']),
        temperature: json['temperature'],
        weatherCondition: json['weatherCondition'],
      );

  static Map<String, dynamic> toJson(DailyForecastEntity entity) => <String, dynamic>{
        'date': entity.date.toIso8601String(),
        'temperature': entity.temperature,
        'weatherCondition': entity.weatherCondition,
      };

  static String serialize(DailyForecastEntity entity) => jsonEncode(entity);
  static DailyForecastEntity deserialize(String json) => DailyForecastEntity.fromJson(jsonDecode(json));
}
