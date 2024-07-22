import 'package:get/get.dart';
import 'package:weather_app/app/core/presentation/stores/state_store.dart';
import 'package:weather_app/app/modules/home/domain/entities/weather_entity.dart';
import 'package:weather_app/app/modules/home/domain/form_entities/city_form_entity.dart';
import 'package:weather_app/app/modules/home/presentation/widgets/city_card.dart';

class HomeStore extends StateStore {
  final RxList<CityFormEntity> _cities = RxList<CityFormEntity>(
    [
      CityFormEntity(name: 'Silverstone', countryName: 'Uk'),
      CityFormEntity(name: 'São Paulo', countryName: 'Brazil'),
      CityFormEntity(name: 'Melbourne', countryName: 'Australia'),
      CityFormEntity(name: 'Monte Carlo', countryName: 'Monaco'),
    ],
  );
  List<CityFormEntity> get cities => _cities;
  set cities(List<CityFormEntity> value) => _cities.value = value;

  final RxList<WeatherEntity> _weatherData = RxList<WeatherEntity>([]);
  List<WeatherEntity> get weatherData => _weatherData;
  set weatherData(List<WeatherEntity> value) => _weatherData.value = value;

  final RxList<CityCard> _cityCards = RxList<CityCard>([]);
  List<CityCard> get cityCards => _cityCards;
  set cityCards(List<CityCard> value) => _cityCards.value = value;

  final RxBool _isOnline = true.obs;
  bool get isOnline => _isOnline.value;
  set online(bool value) => _isOnline.value = value;
}
