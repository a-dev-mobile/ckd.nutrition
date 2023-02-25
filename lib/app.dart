import 'package:device_preview/device_preview.dart';
import 'package:feedback/feedback.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrition/app/app.dart';
import 'package:nutrition/core/config/theme/theme.dart';
import 'package:nutrition/core/router/router.dart';
import 'package:nutrition/localization/gen/app_localizations.dart';



class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const _MobileApp();

    /* MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(
          create: (context) => LocaleCubit(storage: context.read())..load(),
        ),
        BlocProvider(create: (context) => InternetCubit()),
        BlocProvider(create: (context) => DebugCubit()),
        BlocProvider(
          create: (context) => RemoteConfigCubit()..load(),
          lazy: false,
        ),
      ],
      child: const _MobileApp(),
    ); */
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
    final themeMode = ref.watch(themeProvider);
    final go = ref.watch(appRouterProvider);
    // final cubitDebugWatch = context.watch<DebugCubit>();
    // final cubitLocaleWatch = context.watch<LocaleCubit>();

    // debugRepaintRainbowEnabled = cubitDebugWatch.state.isShowRepaintRainbow;

    // debugPaintSizeEnabled = cubitDebugWatch.state.isShowPaintSizeEnabled;

    //  global
    // Intl.defaultLocale = cubitLocaleWatch.state.name;
    initStatusBar(themeMode: themeMode);

    return MaterialApp.router(
          routeInformationProvider: go.router.routeInformationProvider,
          routeInformationParser: go.router.routeInformationParser,
          routerDelegate: go.router.routerDelegate,
          // routerConfig: go.router,
          builder: (context, widget) {
            final child = widget ?? const SizedBox.shrink();

            return DevicePreview.appBuilder(context, child);
          },
          onGenerateTitle: (context) => AppLocalizations.of(context).app_name,
          theme: FlexTheme.lightThemeData(),
          darkTheme: FlexTheme.darkThemeData(),
          themeMode: themeMode,
          // locale: Locale(cubitLocaleWatch.state.name),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
        );
  }
}