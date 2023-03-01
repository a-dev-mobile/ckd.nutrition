import 'package:device_preview/device_preview.dart';
import 'package:feedback/feedback.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:nutrition/app/common/common.dart';
import 'package:nutrition/app/style/style.dart';

import 'package:nutrition/localization/gen/app_localizations.dart';

import 'package:nutrition/navigation/navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(
          create: (context) => LangCubit(storage: context.read())..load(),
        ),
        BlocProvider(create: (context) => InternetCubit()),
        BlocProvider(create: (context) => DebugCubit()),
        BlocProvider(
          create: (context) => RemoteConfigCubit()..load(),
          lazy: false,
        ),
      ],
      child: const _MobileApp(),
    );
  }
}

class _MobileApp extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final go = context.read<AppRouter>();
    final cubitDebugWatch = context.watch<DebugCubit>();
    final cubitLocaleWatch = context.watch<LangCubit>();
    final cubitTheme = context.watch<ThemeCubit>();
    debugRepaintRainbowEnabled = cubitDebugWatch.state.isShowRepaintRainbow;

    debugPaintSizeEnabled = cubitDebugWatch.state.isShowPaintSizeEnabled;

    //  global
    Intl.defaultLocale = cubitLocaleWatch.state.name;
    initStatusBar(themeMode: cubitTheme.state);

    return BetterFeedback(
      child: DevicePreview(
        enabled: cubitDebugWatch.state.isShowDevice,
        builder: (context) => MaterialApp.router(
          routeInformationProvider: go.router.routeInformationProvider,
          routeInformationParser: go.router.routeInformationParser,
          routerDelegate: go.router.routerDelegate,
          // routerConfig: go.router,
          builder: (context, widget) {
            final child = widget ?? const SizedBox.shrink();

            return DevicePreview.appBuilder(context, child);
          },
          onGenerateTitle: (context) => AppLocalizations.of(context).app_name,
          theme: AppTheme.lightThemeData(),
          darkTheme: AppTheme.darkThemeData(),
          themeMode: cubitTheme.state,
          locale: Locale(cubitLocaleWatch.state.name),
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
