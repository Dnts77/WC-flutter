final class Environment._(){
  static const baseUrl = String.fromEnvironment('BASE_URL', defaultValue: 'http://10.0.2.2:8080');

  static String url(String path) => '$baseUrl/$path';

  static String flagUrl(String code) => url('/flags/${code.toLowerCase()}.png');

}