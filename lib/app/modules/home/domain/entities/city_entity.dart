import 'dart:convert';

import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  const CityEntity({
    required this.name,
    required this.country,
    required this.lat,
    required this.lng,
  });

  final String name;
  final String country;
  final double lat;
  final double lng;

  @override
  List<Object> get props => [name, country, lat, lng];

  factory CityEntity.fromJson(Map<String, dynamic> json) => CityEntity(
        name: json['name'],
        country: json['country'],
        lat: json['lat'],
        lng: json['lng'],
      );

  static Map<String, dynamic> toJson(CityEntity entity) => <String, dynamic>{
        'name': entity.name,
        'country': entity.country,
        'lat': entity.lat,
        'lng': entity.lng,
      };

  static String serialize(CityEntity entity) => jsonEncode(entity);
  static CityEntity deserialize(String json) => CityEntity.fromJson(jsonDecode(json));
}
