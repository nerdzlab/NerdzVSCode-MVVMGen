enum Flavor { dev, prod }

class FlavorConfig {
  static FlavorConfig? _instance;
  late final Flavor env;

  factory FlavorConfig() {
    _instance ??= FlavorConfig._();

    return _instance!;
  }

  FlavorConfig._();
}
