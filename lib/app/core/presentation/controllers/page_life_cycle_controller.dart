import 'package:weather_app/app/core/presentation/stores/state_store.dart';

abstract class PageLifeCycleController<S extends StateStore> {
  S? get store;

  void onInit() {}

  void onReady() {}

  void onClose() {}
}
