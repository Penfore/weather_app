import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/app/modules/home/data/datasourcers/internet_datasource.dart';
import 'package:weather_app/app/modules/home/data/repositories/internet_repository.dart';
import 'package:weather_app/app/modules/home/domain/repositories/internet_repository.dart';
import 'package:weather_app/app/modules/home/domain/use_cases/check_internet_use_case.dart';

class MockInternetDriverTrue implements InternetDatasource {
  @override
  Future<bool> get isConnected async {
    return true;
  }
}

class MockInternetDriverFalse implements InternetDatasource {
  @override
  Future<bool> get isConnected async {
    return false;
  }
}

/// It testes the integration among the classes, not the connectivity itself
void main() {
  test('The useCase should return true if there is the possibility for an Internet request', () async {
    final InternetDatasource internetDatasource = MockInternetDriverTrue();
    final InternetRepository internetRepository = InternetRepositoryImpl(internetDatasource: internetDatasource);
    final CheckInternetUseCase checkInternetUseCase = CheckInternetUseCaseImpl(repository: internetRepository);

    final bool hasConnectivity = await checkInternetUseCase.call();

    expect(hasConnectivity, true);
  });

  test('The useCase should return false if there is the possibility for an Internet request', () async {
    final InternetDatasource internetDatasource = MockInternetDriverFalse();
    final InternetRepository internetRepository = InternetRepositoryImpl(internetDatasource: internetDatasource);
    final CheckInternetUseCase checkInternetUseCase = CheckInternetUseCaseImpl(repository: internetRepository);

    final bool hasConnectivity = await checkInternetUseCase.call();

    expect(hasConnectivity, false);
  });
}
