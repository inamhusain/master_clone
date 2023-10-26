import 'package:flutter/material.dart';
import 'package:master_utility/master_utility.dart';
import 'package:provider/provider.dart';

MultiProvider buildProvidersTree() {
  return MultiProvider(
    providers: AppStrings.providers,
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
