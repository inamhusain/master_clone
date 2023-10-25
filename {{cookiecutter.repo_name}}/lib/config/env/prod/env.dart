import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env.production')
abstract class Env {
  @EnviedField(varName: 'KEY1', obfuscate: false)
  static const baseUrl = _Env.baseUrl;
}
