// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Package imports:
import 'package:master_utility/master_utility.dart';
import 'package:{{cookiecutter.repo_name}}/config/assets/colors.gen.dart';
import 'package:{{cookiecutter.repo_name}}/config/sentry/sentry.dart';
import 'package:{{cookiecutter.repo_name}}/constants/pref_keys.dart';
import 'package:{{cookiecutter.repo_name}}/main.dart';

enum Environment { dev, prod }

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
