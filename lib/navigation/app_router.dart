// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrition/core/storage/storage.dart';
import 'package:nutrition/feature/debug_menu/debug_menu.dart';
import 'package:nutrition/feature/onboarding/vew/vew.dart';
import 'package:nutrition/feature/overlay_widget/overlay_widget.dart';
import 'package:nutrition/feature/registration/registration.dart';
import 'package:nutrition/feature/setting/view/setting_page.dart';
import 'package:nutrition/feature/splash/splash.dart';
import 'package:nutrition/feature/test_app/test_app.dart';
import 'package:nutrition/global.dart';

class AppRouter {
  AppRouter({required AppStorage storage}) : _storage = storage;

  // private navigators
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _pageNavigatorKey = GlobalKey<NavigatorState>();

  final AppStorage _storage;

  final GoRouter router = GoRouter(
    // initialLocation: DashBoardPage.path,
    initialLocation: SplashPage.path,
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
            path: SplashPage.path,
            name: SplashPage.name,
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const SplashPage(),
            ),
          ),
          GoRoute(
            path: SettingPage.path,
            name: SettingPage.name,
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const SettingPage(),
            ),
          ),
          GoRoute(
            path: RegistrationPage.path,
            name: RegistrationPage.name,
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const RegistrationPage(),
            ),
          ),
          GoRoute(
            path: DebugMenuPage.path,
            name: DebugMenuPage.name,
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const DebugMenuPage(),
            ),
          ),
          GoRoute(
            path: OnBoardingPage.path,
            name: OnBoardingPage.name,
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const OnBoardingPage(),
            ),
          ),
          GoRoute(
            path: TestAppPage.path,
            name: TestAppPage.name,
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const TestAppPage(),
            ),
          ),
        ],
        navigatorKey: _pageNavigatorKey,
      ),
    ],
    errorPageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: Center(child: Text(state.error.toString())),
    ),
  );

  Future<void> nextPage() async {
    final isFirstTime = await _storage.isFirstStart();

    final isOnboardingCompleted = await _storage.isOnboardingCompleted();

    if (isOnboardingCompleted && !isFirstTime) {
      router.goNamed(RegistrationPage.name);

      return;
    }

    if (isFirstTime) {
      final _ = await _storage.completeFirstStart();
      router.goNamed(SplashPage.name);

      return;
    }

    if (!isOnboardingCompleted) {
      final _ = await _storage.completeFirstStart();
      router.goNamed(OnBoardingPage.name);

      return;
    }
  }

  Future<void> exitApp() async {
    await _storage.clearAll();
    // await _storage.completeOnboarding();
    // await _storage.completeFirstStart();

    router.goNamed(SplashPage.name);
  }
}
