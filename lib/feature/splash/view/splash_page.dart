import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition/core/widget/widget.dart';
import 'package:nutrition/feature/splash/splash.dart';
import 'package:nutrition/navigation/app_router.dart';
import 'package:nutrition/navigation/navigation.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const path = '/splash';
  static const name = 'splash';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => SplashCubit(
        router: context.read<AppRouter>(),
      )..load(),
      child: const _SplashView(),
    );
  }
}

class _SplashView extends StatelessWidget {
  const _SplashView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: const [
          Align(
            child: AppLogo(),
          ),
          Positioned(
            bottom: 30,
            child: AppPageLoad(),
          ),
        ],
      ),
    );
  }
}
