import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable(createToJson: false)
class CityModel {
  CityModel({this.name, this.lat, this.lon, this.country});

  final String? name;
  final double? lat;
  final double? lon;
  final String? country;

  bool checkIfAnyIsNull() {
    return [name, lat, lon, country].contains(null);
  }

  factory CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);
}
