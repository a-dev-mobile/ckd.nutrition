// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:nutrition/core/style/app_text_style.dart';
import 'package:nutrition/features/onboarding/onboarding.dart';
import 'package:nutrition/features/splash/splash.dart';
import 'package:nutrition/gen/assets.gen.dart';

class OnBoardingPage extends ConsumerWidget {
  const OnBoardingPage({super.key});

  static const path = '/onboarding';
  static const name = 'onboarding';

  Future<bool> _willPopScopeCall(BuildContext context) async {
    GoRouter.of(context).goNamed(SplashPage.name);
// code to show toast or modal

    return false; // return true to exit app or return false to cancel exit
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(onboardingProvider);
    final notifier = ref.watch(onboardingProvider.notifier);

    final pageDecoration = PageDecoration(
      titleTextStyle: AppTextStyles.h5(),
      bodyTextStyle: AppTextStyles.bodyText2(),
      bodyPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      imagePadding: EdgeInsets.zero,
    );

    return WillPopScope(
      onWillPop: () => _willPopScopeCall(context),
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Распределение воды',
            body:
                'Диализные пациенты должны тщательно контролировать потребление жидкости.\nЭто особенно важно, если ваши почки совсем не вырабатывают мочу',
            image: const OnboardingItemImage(
              assetName: AppAssetsSVG.onb1,
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: 'Распределение еды',
            body:
                'Для пациента на гемодиализе с массой тела 70–75 кг диета должна содержать 75–85 г белка и 2500–2800 ккал.\nЕсли не обеспечивается нужное количество белка и энергии, то закономерно развивается питательная (белково-энергетическая) недостаточность.',
            image: const OnboardingItemImage(
              assetName: AppAssetsSVG.onb2,
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: 'Важно!',
            body:
                'Данное приложение не может и не преследует цели заменить Вашего лечашего врача.',
            image: const OnboardingItemImage(
              assetName: AppAssetsSVG.onb3,
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: 'Тест',
            body:
                'Пройдите тест, что бы узнать риски рецидива болезни и получить оптимальные рекомендации.',
            image: const OnboardingItemImage(
              assetName: AppAssetsSVG.onb4,
            ),
            decoration: pageDecoration,
          ),
        ],
        showBackButton: true,
        back: const Icon(Icons.arrow_back),
        next: const Icon(Icons.arrow_forward),
        done: const Text('Далее'),
        onDone: notifier.complectOnboarding,
      ),
    );
  }
}
