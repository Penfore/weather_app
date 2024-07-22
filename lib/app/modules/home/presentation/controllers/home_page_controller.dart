import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:weather_app/app/core/presentation/controllers/page_life_cycle_controller.dart';
import 'package:weather_app/app/modules/home/domain/entities/weather_entity.dart';
import 'package:weather_app/app/modules/home/domain/use_cases/check_internet_use_case.dart';
import 'package:weather_app/app/modules/home/domain/use_cases/fetch_city_weather_use_case.dart';
import 'package:weather_app/app/modules/home/presentation/stores/home_store.dart';
import 'package:weather_app/app/modules/home/presentation/widgets/city_card.dart';

class HomePageController extends PageLifeCycleController {
  HomePageController({
    required this.fetchCityWeatherUseCase,
    required this.checkInternetUseCase,
    required this.store,
    required this.storage,
  });

  final FetchCitiesWeatherUseCase fetchCityWeatherUseCase;
  final CheckInternetUseCase checkInternetUseCase;

  @override
  final HomeStore store;
  final FlutterSecureStorage storage;

  @override
  Future<void> onReady() async {
    await initialize();
  }

  Future<void> initialize() async {
    final checkInternet = await checkConnectivity();
    if (checkInternet) {
      store.online = true;
      await fetchWeatherList();
      await saveToStorage();
      await assignCityCards();
    } else {
      store.online = false;
      await readFromStorage();
      await assignCityCards();
    }
  }

  Future<bool> checkConnectivity() async {
    try {
      store.loading();
      final response = await checkInternetUseCase.call();
      store.completed();
      return response;
    } on Exception catch (e) {
      store.error = e;
      return false;
    }
  }

  Future<void> readFromStorage() async {
    try {
      store.loading();
      for (var i = 0; i < store.cities.length; i++) {
        final weather = await storage.read(key: 'weather_data[$i]');
        debugPrint('RESPOSTA $weather');
        if (weather != null) {
          store.weatherData.add(WeatherEntity.deserialize(weather));
        }
      }
      store.completed();
    } on Exception catch (e) {
      store.error = e;
    }
  }

  Future<void> saveToStorage() async {
    try {
      store.loading();
      for (var i = 0; i < store.cities.length; i++) {
        await storage.write(key: 'weather_data[$i]', value: WeatherEntity.serialize(store.weatherData[i]));
        final response = await storage.read(key: 'weather_data[$i]');
        debugPrint('RESPOSTA ${response!}');
      }
      store.completed();
    } on Exception catch (e) {
      store.error = e;
    }
  }

  Future<void> assignCityCards() async {
    try {
      store.loading();
      for (WeatherEntity weather in store.weatherData) {
        final card = CityCard(weather: weather);
        store.cityCards.add(card);
      }
      store.completed();
    } on Exception catch (e) {
      store.error = e;
    }
  }

  Future<void> fetchWeatherList() async {
    try {
      store.loading();
      store.weatherData = await fetchCityWeatherUseCase.call(citiesForms: store.cities);
      store.completed();
    } on Exception catch (e) {
      store.error = e;
    }
  }
}
