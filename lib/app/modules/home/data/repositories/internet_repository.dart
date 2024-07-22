import 'package:weather_app/app/modules/home/data/datasourcers/internet_datasource.dart';
import 'package:weather_app/app/modules/home/domain/repositories/internet_repository.dart';

class InternetRepositoryImpl implements InternetRepository {
  InternetRepositoryImpl({
    required this.internetDatasource,
  });

  final InternetDatasource internetDatasource;

  @override
  Future<bool> isConnected() async {
    return internetDatasource.isConnected;
  }
}
