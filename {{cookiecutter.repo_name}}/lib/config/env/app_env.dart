import 'package:{{cookiecutter.repo_name}}/config/flavours/app.dart';

class AppEnv {
  String? _env;
  void getAppEnvironment() async {
    _env = await AppConfig().getEnvironment();
  }
}
