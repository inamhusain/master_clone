import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env.production')
abstract class EnvProd {
  @EnviedField(varName: 'BASE_URL', obfuscate: false)
  static String baseUrl = _EnvProd.baseUrl;
  @EnviedField(varName: 'SENTRY_URL', obfuscate: false)
  static String sentryUrl = _EnvProd.sentryUrl;
}
