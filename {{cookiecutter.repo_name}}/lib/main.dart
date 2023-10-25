// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:master_utility/master_utility.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
// Project imports:
import 'package:slot_booking/constants/strings.dart';
import 'package:slot_booking/constants/theme.dart';
import 'package:slot_booking/services/notification/firebase_messaging_services.dart';
import 'package:slot_booking/services/notification/local_notification.dart';
import 'package:slot_booking/views/splash/splash.dart';

Future<void> firebaseInit() async {
  await FirebaseMessagingService.instance.init();
  await LocalNotificationService.instance.init();
}

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
