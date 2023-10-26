import 'package:{{cookiecutter.repo_name}}/config/env/dev/env.dart';
import 'package:{{cookiecutter.repo_name}}/config/flavours/app.dart';
import 'package:{{cookiecutter.repo_name}}/config/flavours/app.dart';

class AppEnv {
  String? _env;
  EnvDev? env;
  void getAppEnvironment() async {
    _env = await AppConfig().getEnvironment();
    // if(_env == Environment.dev.name){
    //   env ==
    // }else{}
  }

  // static const String sentryUrl
}
