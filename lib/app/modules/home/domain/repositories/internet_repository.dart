abstract class InternetRepository {
  /// Checks if there is a possibility of maing an Internet request
  /// Uses 'google.com' as a tester
  Future<bool> isConnected();
}
