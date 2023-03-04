// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrition/core/providers/storage/app_storage_provider.dart';
import 'package:nutrition/features/debug_menu/debug_menu.dart';
import 'package:nutrition/features/overlay_widget/view/view.dart';
import 'package:nutrition/features/splash/splash.dart';
import 'package:nutrition/global.dart';

final appRouterProvider = Provider<AppRouter>((ref) {
  final storage = ref.read(appStorageProvider);

  return AppRouter(storage: storage);
});

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
      path: DebugMenuPage.path,
      name: DebugMenuPage.name,
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: const DebugMenuPage(),
      ),
    ),

          GoRoute(
            path: SplashPage.path,
            name: SplashPage.name,
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const SplashPage(),
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
      router.goNamed(SplashPage.name);

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

    router.goNamed(SplashPage.name);
  }
}
