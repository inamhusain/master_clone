import 'package:{{cookiecutter.repo_name}}/config/env/dev/env.dart';
import 'package:{{cookiecutter.repo_name}}/config/env/prod/env.dart';
import 'package:{{cookiecutter.repo_name}}/config/flavours/app.dart';
import 'package:{{cookiecutter.repo_name}}/config/flavours/app.dart';
import 'package:{{cookiecutter.repo_name}}/config/flavours/app.dart';

class AppEnv {
  static String? _env = "";
  static bool _isDev = true;

  void getAppEnvironment() async {
    _env = await AppConfig().getEnvironment();
    _isDev = _env == Environment.dev.name;
  }

  static String sentryUrl = _isDev ? EnvDev.sentryUrl : EnvProd.sentryUrl;
}
