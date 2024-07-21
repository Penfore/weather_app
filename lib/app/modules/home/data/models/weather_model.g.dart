// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      current: json['current'] == null
          ? null
          : Current.fromJson(json['current'] as Map<String, dynamic>),
      daily: (json['daily'] as List<dynamic>?)
          ?.map((e) => DailyForecastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      temp: (json['temp'] as num).toDouble(),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      main: json['main'] as String,
    );
