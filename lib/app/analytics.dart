import 'dart:async';
import 'dart:developer';

import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:nutrition/global.dart';

class Analytics {
  factory Analytics() => _internalSingleton;
  Analytics._internal();
  static final Analytics _internalSingleton = Analytics._internal();

  static Future<void> _toAnalyze(
    String mainEvent,
    String subEvent,
    String value,
  ) async {
    log('--');
    log('--$mainEvent');
    log('--$subEvent');
    log('--$value');
    log('--');

    if (DartDefine.IS_ANALYTICS) {
      await AppMetrica.reportEventWithMap(mainEvent, {subEvent: value});

      await FirebaseAnalytics.instance.logEvent(
        name: mainEvent,
        parameters: {subEvent: value},
      );
    }
  }

  static const _userData = 'User data';

  static Future<void> sendUserData({
    required String event,
    required String value,
  }) async {
    const mainStep = _userData;
    await _toAnalyze(mainStep, event, value);
  }
}
