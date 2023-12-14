import 'package:flutter/widgets.dart';
import 'package:master_utility/master_utility.dart';
import 'package:{{cookiecutter.repo_name}}/config/env/app_env.dart';
import 'package:{{cookiecutter.repo_name}}/helpers/internet_connectivity.dart';

class SplashProvider extends ChangeNotifier {
  static const int duration_3s = 3;
   

  void init(context) async {
    InternetConnectivityHelper().init();
    SizeHelper.setMediaQuerySize(context: context);
    dioClient.setConfiguration(AppEnv.baseUrl);

    await Future.delayed(const Duration(seconds: duration_3s ), () async {});
  }
}
