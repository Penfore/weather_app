import 'package:json_annotation/json_annotation.dart';

part 'weather_condition_model.g.dart';

@JsonSerializable(createToJson: false)
class WeatherConditionModel {
  WeatherConditionModel({
    required this.main,
  });

  /// Weather condition
  final String main;

  factory WeatherConditionModel.fromJson(Map<String, dynamic> json) => _$WeatherConditionModelFromJson(json);
}
