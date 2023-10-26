import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env.development')
abstract class EnvDev {
  @EnviedField(varName: 'BASE_URL', obfuscate: false)
  static String baseUrl = _EnvDev.baseUrl;
  @EnviedField(varName: 'SENTRY_URL', obfuscate: false)
  static String sentryUrl = _EnvDev.sentryUrl;
}
