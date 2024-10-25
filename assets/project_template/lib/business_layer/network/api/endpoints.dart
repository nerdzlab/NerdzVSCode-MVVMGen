import 'package:flutter/foundation.dart';

final class Endpoints {
  /// Base url for API
  static String get baseUrl {
    if (kDebugMode || kProfileMode) {
      return "https://link.dev";
    } else {
      return "https://link.prod";
    }
  }

  /// Timeout when receiving data
  static const int receiveTimeout = 15000;

  /// Timeout when opening a request.
  static const int connectionTimeout = 15000;

  static const String someEndpoint = '/api/someEndpoint';
}
