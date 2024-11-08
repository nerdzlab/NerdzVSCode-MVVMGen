import 'package:envied/envied.dart';

part 'prod_env.g.dart';

@Envied(path: '.prod.env')
abstract class ProdEnv {
  @EnviedField(varName: 'API_URL')
  static const String apiUrl = _ProdEnv.apiUrl;
}
