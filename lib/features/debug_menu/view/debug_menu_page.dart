// ignore_for_file: unused_element, lines_longer_than_80_chars

import 'dart:io';

import 'package:feedback/feedback.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:nutrition/core/services/navigation/app_router_service.dart';
import 'package:nutrition/core/services/storage/app_storage_service.dart';
import 'package:nutrition/core/style/app_text_style.dart';
import 'package:nutrition/features/debug_menu/debug_menu.dart';

import 'package:nutrition/features/splash/splash.dart';

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class DebugMenuPage extends ConsumerWidget {
  const DebugMenuPage({super.key});

  static const path = '/debug-menu';
  static const name = 'debug_menu';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providerDebug = ref.watch(debugProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug Menu '),
      ),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              const Center(child: Text('---Setting---')),
              SwitchListTile(
                value: providerDebug.isShowDevice,
                onChanged: (v) => ref
                    .read(debugProvider.notifier)
                    .setDevicePreview(isShow: v),
                title: const Text('Show device preview'),
                dense: true,
                visualDensity: const VisualDensity(vertical: -3),
              ),
              SwitchListTile(
                value: providerDebug.isShowBtnHttpLog,
                onChanged: (v) => ref
                    .read(debugProvider.notifier)
                    .setShowBtnHttpLog(isShow: v),
                title: const Text('Show button http log'),
                dense: true,
                visualDensity: const VisualDensity(vertical: -3),
              ),
              SwitchListTile(
                value: providerDebug.isShowRepaintRainbow,
                onChanged: (v) => ref
                    .read(debugProvider.notifier)
                    .setShowDebugRepaintRainbow(isShow: v),
                title: const Text('debugRepaintRainbowEnabled'),
                dense: true,
                visualDensity: const VisualDensity(vertical: -3),
              ),
              SwitchListTile(
                value: providerDebug.isShowPaintSizeEnabled,
                onChanged: (v) => ref
                    .read(debugProvider.notifier)
                    .setShowPaintSizeEnabled(isShow: v),
                title: const Text('debugPaintSizeEnabled'),
                dense: true,
                visualDensity: const VisualDensity(vertical: -3),
              ),
              const Center(child: Text('---Начало---')),
              Wrap(
                children: const [
                  _ItemPage(name: 'splash', route: SplashPage.name),
                  // _ItemPage(
                  //   name: 'регистрация',
                  //   route: RegistrationPage.name,
                  // ),
                  // _ItemPage(
                  //   name: 'onboarding',
                  //   route: OnBoardingPage.name,
                  // ),

                  // _ItemPage(
                  //   name: 'favorite',
                  //   route: FavoritePage.name,
                  // ),
                  // _ItemPage(
                  //   name: 'setting',
                  //   route: SettingPage.name,
                  // ),
                  // _ItemPage(
                  //   name: 'dashboard',
                  //   route: BottomNavBarPage.name,
                  // ),
                ],
              ),
              const Center(child: Text('---Вход---')),
              const Center(child: Text('---Разное---')),
              const Center(child: Text('---Вспомогательные---')),
              const Center(child: Text('---Тестирование функционала---')),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Theme.of(context).colorScheme.background,
              height: 50,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OutlinedButton(
                    // ignore: prefer-extracting-callbacks
                    onPressed: () {
                      final router = ref.read(appRouterServiceProvider).router;
                      if (router.canPop()) {
                        router.pop();
                      }
                      BetterFeedback.of(context).show((feedback) async {
                        final screenshotFilePath =
                            await writeImageToStorage(feedback.screenshot);
                        final _ = await Share.shareXFiles(
                          [XFile(screenshotFilePath)],
                          text: feedback.text,
                        );
                      });
                    },
                    child: const Text('FEEDBACK'),
                  ),
                  OutlinedButton(
                    // ignore: prefer-extracting-callbacks
                    onPressed: () {
                      ref.read(appStorageServiceProvider).clearAll();
                      ref
                          .read(appRouterServiceProvider)
                          .router
                          .goNamed(SplashPage.name);
                    },
                    child: const Text('RESTART'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String> writeImageToStorage(Uint8List feedbackScreenshot) async {
    final output = await getTemporaryDirectory();
    final screenshotFilePath = '${output.path}/feedback.png';
    final screenshotFile = File(screenshotFilePath);
    final _ = await screenshotFile.writeAsBytes(feedbackScreenshot);

    return screenshotFilePath;
  }
}

class _ItemPage extends StatelessWidget {
  const _ItemPage({
    required this.name,
    super.key,
    this.route,
    this.onPressed,
    this.isPushPage = true,
  });

  final String name;
  final bool isPushPage;
  final String? route;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: route != null
          ? () {
              isPushPage
                  ? GoRouter.of(context).pushNamed(route!)
                  : GoRouter.of(context).goNamed(route!);
            }
          : onPressed,
      child: Text(
        name,
        style: AppTextStyles.s20w600h24(),
      ),
    );
  }
}
