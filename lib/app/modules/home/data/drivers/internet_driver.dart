import 'dart:io';

import 'package:weather_app/app/modules/home/data/datasourcers/internet_datasource.dart';

class InternetDriver implements InternetDatasource {
  @override
  Future<bool> get isConnected async {
    try {
      final connectivityResult = await InternetAddress.lookup('google.com');
      if (connectivityResult.isNotEmpty && connectivityResult[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Error ocurred while checking internet connection');
    }
  }
}
