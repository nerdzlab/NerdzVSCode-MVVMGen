import 'package:VIEW_MODEL_PROJECT_IDENTIFIER_QW32/env/dev_env.dart';
import 'package:VIEW_MODEL_PROJECT_IDENTIFIER_QW32/env/prod_env.dart';

enum Flavor { dev, prod }

class FlavorConfig {
  FlavorConfig._();

  factory FlavorConfig() {
    _instance ??= FlavorConfig._();

    return _instance!;
  }

  static FlavorConfig? _instance;
  late final Flavor flavor;

  String getBaseUrl() => switch (flavor) {
        Flavor.dev => DevEnv.apiUrl,
        Flavor.prod => ProdEnv.apiUrl,
      };

  static bool isDevelopment() => _instance?.flavor == Flavor.dev;
  static bool isProduction() => _instance?.flavor == Flavor.prod;
}