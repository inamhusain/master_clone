// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:{{cookiecutter.repo_name}}/config/env/app_env.dart';
// Project imports:
import 'package:{{cookiecutter.repo_name}}/config/flavours/app.dart';

class InitSentry {
  Future<void> runAppWithSentry(MultiProvider widget, {required Environment environment}) async {
    String sentryDSN = AppEnv.sentryUrl;

    kReleaseMode
        ? runZonedGuarded(() async {
            await SentryFlutter.init(
              (options) {
                options.dsn = sentryDSN;
                options.attachScreenshot = true;
                options.environment = environment.name;
                options.attachThreads = true;
                options.attachStacktrace = true;
                options.reportPackages = false;
                options.attachThreads = true;
              },
            );

            runApp(SentryScreenshotWidget(child: widget));
          }, (exception, stackTrace) async {
            await Sentry.captureException(exception, stackTrace: stackTrace);
          })
        : runApp(widget);
  }
}
