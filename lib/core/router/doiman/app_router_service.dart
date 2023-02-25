// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrition/core/local_storage/local_storage.dart';

import 'package:nutrition/feature/debug_menu/debug_menu.dart';
import 'package:nutrition/feature/onboarding/vew/vew.dart';
import 'package:nutrition/feature/overlay_widget/overlay_widget.dart';
import 'package:nutrition/feature/registration/registration.dart';
import 'package:nutrition/feature/setting/view/setting_page.dart';
import 'package:nutrition/features/splash/splash.dart';

import 'package:nutrition/feature/test_app/test_app.dart';
import 'package:nutrition/dart_define.dart';

class AppRouterService {
  AppRouterService({required AppLocalStorageService storage})
      : _storage = storage;

  // private navigators
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _pageNavigatorKey = GlobalKey<NavigatorState>();

  final AppLocalStorageService _storage;

  final GoRouter router = GoRouter(
    // initialLocation: DashBoardPage.path,
    initialLocation: SplashScreen.path,
    observers: <NavigatorObserver>[
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    ],
    // ignore: avoid_redundant_argument_values
    debugLogDiagnostics: DartDefine.IS_DEBUG,
    navigatorKey: _rootNavigatorKey,

    routes: [
      ShellRoute(
        builder: (_, GoRouterState state, child) {
          return OverlayWidget(goRouterState: state, child: child);
        },
        routes: [
          GoRoute(
            path: SplashScreen.path,
            name: SplashScreen.name,
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const SplashScreen(),
            ),
          ),
        ],
        navigatorKey: _pageNavigatorKey,
      ),
    ],

    // ShellRoute(
    //   // builder: (_, GoRouterState state, child) {
    //     // return OverlayWidget(goRouterState: state, child: child);
    //   // },
    //   ,
    //   navigatorKey: _pageNavigatorKey,
    // ),

    // GoRoute(
    //   path: SettingPage.path,
    //   name: SettingPage.name,
    //   pageBuilder: (context, state) => MaterialPage<void>(
    //     key: state.pageKey,
    //     child: const SettingPage(),
    //   ),
    // ),
    // GoRoute(
    //   path: RegistrationPage.path,
    //   name: RegistrationPage.name,
    //   pageBuilder: (context, state) => MaterialPage<void>(
    //     key: state.pageKey,
    //     child: const RegistrationPage(),
    //   ),
    // ),
    // GoRoute(
    //   path: DebugMenuPage.path,
    //   name: DebugMenuPage.name,
    //   pageBuilder: (context, state) => MaterialPage<void>(
    //     key: state.pageKey,
    //     child: const DebugMenuPage(),
    //   ),
    // ),
    // GoRoute(
    //   path: OnBoardingPage.path,
    //   name: OnBoardingPage.name,
    //   pageBuilder: (context, state) => MaterialPage<void>(
    //     key: state.pageKey,
    //     child: const OnBoardingPage(),
    //   ),
    // ),
    // GoRoute(
    //   path: TestAppPage.path,
    //   name: TestAppPage.name,
    //   pageBuilder: (context, state) => MaterialPage<void>(
    //     key: state.pageKey,
    //     child: const TestAppPage(),
    //   ),
    // ),

    errorPageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: Center(child: Text(state.error.toString())),
    ),
  );

  Future<void> nextPage() async {
    final isFirstTime = _storage.isFirstStart();

    final isOnboardingCompleted = _storage.isOnboardingCompleted();

    // if (isOnboardingCompleted && !isFirstTime) {
    //   router.goNamed(RegistrationPage.name);

    //   return;
    // }

    if (isFirstTime) {
      final _ = _storage.completeFirstStart();
      router.goNamed(SplashScreen.name);

      return;
    }

    // if (!isOnboardingCompleted) {
    //   final _ = _storage.completeFirstStart();
    //   router.goNamed(OnBoardingPage.name);

    //   return;
    // }
  }

  Future<void> exitApp() async {
    await _storage.clearAll();
    // await _storage.completeOnboarding();
    // await _storage.completeFirstStart();

    router.goNamed(SplashScreen.name);
  }
}