import 'package:flutter/material.dart';
import 'package:ls/constants/app_providers.dart';
import 'package:ls/constants/theme.dart';
import 'package:master_utility/master_utility.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

MultiProvider buildProvidersTree() {
  return MultiProvider(
    providers: AppProviders.providers,
    child: MasterUtilityMaterialApp(
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: true,
          ),
          child: DismissKeyboard(child: child ?? const SplashScreen())),
      debugShowCheckedModeBanner: false,
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
      navigatorObservers: [
        SentryNavigatorObserver(),
      ],
      localizationsDelegates: const [
        RefreshLocalizations.delegate,
      ],
    ),
  );
}
