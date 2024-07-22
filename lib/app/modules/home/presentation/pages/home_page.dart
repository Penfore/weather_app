import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:weather_app/app/core/utils/modular_injector.dart';
import 'package:weather_app/app/modules/home/domain/entities/weather_entity.dart';
import 'package:weather_app/app/modules/home/presentation/controllers/home_page_controller.dart';
import 'package:weather_app/app/modules/home/presentation/widgets/city_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularInjector<HomePage, HomePageController> {
  @override
  Widget build(BuildContext context) {
    List<CityCard> cards = controller.store.cityCards;
    final weatherData = controller.store.weatherData;

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () async => controller.refreshPage(),
            icon: const Icon(Icons.refresh),
          ),
          title: const Text('Weather'),
          actions: [
            if (!controller.store.isOnline)
              const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Text('Offline', style: TextStyle(color: Colors.red)),
              ),
          ],
        ),
        body: GestureDetector(
          onTap: controller.unfocus,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchField(
                      hint: 'Search for a city in the list',
                      controller: controller.store.searchFieldController,
                      onSuggestionTap: (weather) {
                        cards.clear();
                        cards.add(CityCard(weather: weather.item!));
                        controller.unfocus();
                      },
                      focusNode: controller.store.focusNode,
                      suggestions: weatherData
                          .map(
                            (e) => SearchFieldListItem<WeatherEntity>(
                              e.city!.name,
                              item: e,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(e.city!.name),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  ...cards.map(
                    (e) => Column(
                      children: [
                        e,
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
