// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:{{cookiecutter.repo_name}}/constants/pref_keys.dart';
// Package imports:
import 'package:master_utility/master_utility.dart';
import 'package:{{cookiecutter.repo_name}}/config/assets/colors.gen.dart';

enum Environment { adminDev, adminProd, userDev, userProd }

class AppConfig {
  Future<void> setAppConfig({required Environment environment}) async {
    await _initializeApp(environment: environment);
    await PreferenceServiceHelper().setStringPrefValue(key: PreferenceKeys.environment, value: environment.name);
    await InitSentry().runAppWithSentry(buildProvidersTree(), environment: environment);
  }

  Future<String> getEnvironment() async {
    String environment = await PreferenceServiceHelper().getStringPrefValue(key: PreferenceKeys.environment);
    return environment;
  }

  Future<void> _initializeApp({required Environment environment}) async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.white,
        systemNavigationBarDividerColor: AppColors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    await PreferenceServiceHelper.init();
  }
}
