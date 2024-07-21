import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/core/utils/modular_injector.dart';
import 'package:weather_app/app/modules/home/presentation/controllers/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularInjector<HomePage, HomePageController> {
  @override
  Widget build(BuildContext context) {
    final cards = controller.store.cityCards;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weather'),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(onPressed: () {}, child: const Text('Selected cities')),
            ],
          ),
        ),
      ),
      body: Obx(
        () => ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: cards.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            return cards[index];
          },
        ),
      ),
    );
  }
}
