import 'package:envied/envied.dart';

part 'dev_env.g.dart';

@Envied(path: '.dev.env')
abstract class DevEnv {
  @EnviedField(varName: 'API_URL')
  static const String apiUrl = _DevEnv.apiUrl;
}
