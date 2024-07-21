import 'package:json_annotation/json_annotation.dart';

part 'temperature_model.g.dart';

@JsonSerializable(createToJson: false)
class TemperatureModel {
  TemperatureModel({
    required this.day,
  });

  final double day;

  factory TemperatureModel.fromJson(Map<String, dynamic> json) => _$TemperatureModelFromJson(json);
}
