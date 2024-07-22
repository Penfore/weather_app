import 'package:flutter/material.dart';
import 'package:weather_app/app/core/core.dart';
import 'package:weather_app/app/modules/home/domain/entities/weather_entity.dart';
import 'package:weather_app/app/modules/home/home.dart';
import 'package:weather_app/app/modules/home/presentation/pages/card_page.dart';

class CityCard extends StatelessWidget {
  const CityCard({
    super.key,
    required this.weather,
  });

  final WeatherEntity weather;

  @override
  Widget build(BuildContext context) {
    final List<DailyForecastEntity> firstFiveDaysForecast =
        weather.dailyForecast!.length > 5 ? weather.dailyForecast!.sublist(0, 5) : weather.dailyForecast!;

    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CardPage(weather: weather),
        ),
      ),
      child: Container(
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
                Text('${weather.city!.name}, ${weather.city!.country}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Current temperature: '),
                Text('${weather.currentTemperature}°C'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Current weather: '),
                Text(weather.currentWeatherCondition),
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
      ),
    );
  }
}
