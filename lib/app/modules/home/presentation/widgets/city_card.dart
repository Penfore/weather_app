import 'package:flutter/material.dart';
import 'package:weather_app/app/core/core.dart';
import 'package:weather_app/app/modules/home/home.dart';

class CityCard extends StatelessWidget {
  const CityCard({
    super.key,
    required this.cityName,
    required this.countryName,
    required this.currentTemperature,
    required this.currentWeatherCondition,
    required this.dailyForecast,
  });

  final String cityName;
  final String countryName;
  final double currentTemperature;
  final String currentWeatherCondition;
  final List<DailyForecastEntity> dailyForecast;

  @override
  Widget build(BuildContext context) {
    final List<DailyForecastEntity> firstFiveDaysForecast =
        dailyForecast.length > 5 ? dailyForecast.sublist(0, 5) : dailyForecast;

    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      height: 160,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('City name: '),
              Text('$cityName, $countryName'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Current temperature: '),
              Text('$currentTemperature°C'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Current weather: '),
              Text(currentWeatherCondition),
            ],
          ),
          Column(
            children: [
              const Text('Next 5 days condition: '),
              SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: firstFiveDaysForecast.map((forecast) {
                    return NextDayBox(
                      day: formatDate(forecast.date),
                      temperature: '${forecast.temperature}°C',
                      weatherCondition: forecast.weatherCondition,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
