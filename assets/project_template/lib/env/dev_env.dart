import 'package:envied/envied.dart';

part 'dev_env.g.dart';

@Envied(path: '.dev.env')
abstract class DevEnv {
  @EnviedField(varName: 'API')
  static const String api = _DevEnv.api;
}
