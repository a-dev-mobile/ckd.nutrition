import 'package:device_preview/device_preview.dart';
import 'package:feedback/feedback.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nutrition/core/services/locale/locale_provider.dart';

import 'package:nutrition/core/services/navigation/app_router_service.dart';
import 'package:nutrition/core/services/theme/theme_providers.dart';
import 'package:nutrition/core/style/flex_theme.dart';
import 'package:nutrition/features/debug_menu/debug_menu.dart';

import 'package:nutrition/localization/gen/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const _MobileApp();
  }
}

class _MobileApp extends ConsumerWidget {
  const _MobileApp();
  void initStatusBar({required ThemeMode themeMode}) {
    Brightness? statusBarIconBrightness;

    statusBarIconBrightness =
        themeMode == ThemeMode.light ? Brightness.dark : Brightness.light;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: statusBarIconBrightness,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final go = context.read<AppRouterService>();
    final themeMode = ref.watch(themeProvider).themeMode;
    final navigator = ref.watch(appRouterServiceProvider);
    final debug = ref.watch(debugProvider);
    final locale = ref.watch(localeProvider);

    debugRepaintRainbowEnabled = debug.isShowRepaintRainbow;

    debugPaintSizeEnabled = debug.isShowPaintSizeEnabled;

    //  global
    Intl.defaultLocale = locale.value;
    initStatusBar(themeMode: themeMode);
    // print('main build');

    return BetterFeedback(
      child: DevicePreview(
        enabled: debug.isShowDevice,
        builder: (context) => MaterialApp.router(
          useInheritedMediaQuery: true,
          routeInformationProvider: navigator.router.routeInformationProvider,
          routeInformationParser: navigator.router.routeInformationParser,
          routerDelegate: navigator.router.routerDelegate,

          // routerConfig: go.router,
          builder: (context, widget) {
            final child = widget ?? const SizedBox.shrink();

            return DevicePreview.appBuilder(context, child);
          },
          onGenerateTitle: (context) => AppLocalizations.of(context).app_name,
          theme: FlexTheme.lightThemeData(),
          darkTheme: FlexTheme.darkThemeData(),
          themeMode: themeMode,
          locale: Locale(locale.name),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
