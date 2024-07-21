import 'package:equatable/equatable.dart';

class DailyForecastEntity extends Equatable {
  const DailyForecastEntity({
    required this.date,
    required this.temperature,
    required this.weatherCondition,
  });

  final String date;
  final double temperature;
  final String weatherCondition;

  @override
  List<Object> get props => [date, temperature, weatherCondition];
}
