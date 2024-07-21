// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      temp: (json['temp'] as num?)?.toDouble(),
      main: json['main'] as String?,
      daily: (json['daily'] as List<dynamic>?)
          ?.map((e) => DailyForecastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
