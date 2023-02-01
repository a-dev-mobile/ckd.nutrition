/// DartDefine Singleton class
// ignore_for_file: constant_identifier_names

abstract class DartDefine {
  static const IS_DEBUG = bool.fromEnvironment('IS_DEBUG');
  static const IS_ANALYTICS = bool.fromEnvironment('IS_ANALYTICS_ENABLED');

  static const APP_DB_PASSWORD = String.fromEnvironment('APP_DB_PASSWORD');
  static const API_KEY_DADATA = String.fromEnvironment('API_KEY_DADATA');
  static const API_KEY_APP_METRIC =
      String.fromEnvironment('API_KEY_APP_METRIC');
}