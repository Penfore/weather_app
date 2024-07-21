import 'package:flutter/cupertino.dart';

class CityFormEntity {
  CityFormEntity({
    required String name,
    required String countryName,
  }) {
    nameController.text = name;
    countryNameController.text = name;
  }

  final nameController = TextEditingController();
  final countryNameController = TextEditingController();
}
