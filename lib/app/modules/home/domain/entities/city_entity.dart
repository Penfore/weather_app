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
}
