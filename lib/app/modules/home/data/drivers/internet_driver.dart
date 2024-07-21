import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:weather_app/app/modules/home/data/datasourcers/internet_datasource.dart';

class InternetDriver implements InternetDatasource {
  InternetDriver() : connectivity = Connectivity();

  final Connectivity connectivity;
  @override
  Future<bool> get isConnected async {
    try {
      final connectivityResult = await (connectivity.checkConnectivity());
      return connectivityResult != [ConnectivityResult.none];
    } catch (e) {
      throw Exception('Error ocurred while checking internet connection');
    }
  }
}
