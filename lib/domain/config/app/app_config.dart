class AppConfig {
  final String domain = 'http://localhost';
  final String apiPath = 'api';

  String getApiEndpoint() {
    return domain + apiPath;
  }
}
