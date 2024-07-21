import 'package:flutter/material.dart';

class NextDayBox extends StatelessWidget {
  const NextDayBox({
    super.key,
    required this.day,
    required this.temperature,
    required this.weatherCondition,
  });

  final String day;
  final String temperature;
  final String weatherCondition;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(day),
        Text(temperature),
        Text(weatherCondition, overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
