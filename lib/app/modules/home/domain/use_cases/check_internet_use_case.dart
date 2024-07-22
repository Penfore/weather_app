import 'package:weather_app/app/modules/home/domain/repositories/internet_repository.dart';

abstract class CheckInternetUseCase {
  Future<bool> call();
}

class CheckInternetUseCaseImpl implements CheckInternetUseCase {
  CheckInternetUseCaseImpl({
    required this.repository,
  });

  final InternetRepository repository;

  @override
  Future<bool> call() async {
    return repository.isConnected();
  }
}
