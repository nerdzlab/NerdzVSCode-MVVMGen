import 'package:VIEW_MODEL_PROJECT_IDENTIFIER_QW32/business_layer/utils/flavor_config.dart';

final class Endpoints {
  /// Base url for API
  static String get baseUrl => FlavorConfig().getBaseUrl();

  /// Timeout when receiving data
  static const int receiveTimeout = 15000;

  /// Timeout when opening a request.
  static const int connectionTimeout = 15000;

  static const String someEndpoint = '/api/someEndpoint';
}
