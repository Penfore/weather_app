import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  const CityCard({
    super.key,
    required this.cityName,
    required this.countryName,
    required this.currentTemperature,
    required this.currentWeatherCondition,
  });

  final String cityName;
  final String countryName;
  final double currentTemperature;
  final String currentWeatherCondition;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      height: 160,
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('City name: '),
              Text('São Paulo, Brazil'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Current temperature: '),
              Text('25C'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Current weather: '),
              Text('Raining'),
            ],
          ),
          Column(
            children: [
              Text('Next 5 days condition: '),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NextDayBox(
                    day: 'seg.',
                    temperature: '30',
                    weatherCondition: 'sunny',
                  ),
                  NextDayBox(
                    day: 'seg.',
                    temperature: '30',
                    weatherCondition: 'sunny',
                  ),
                  NextDayBox(
                    day: 'seg.',
                    temperature: '30',
                    weatherCondition: 'sunny',
                  ),
                  NextDayBox(
                    day: 'seg.',
                    temperature: '30',
                    weatherCondition: 'sunny',
                  ),
                  NextDayBox(
                    day: 'seg.',
                    temperature: '30',
                    weatherCondition: 'sunny',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
      children: [
        Text(day),
        Text(temperature),
        Text(
          weatherCondition,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
