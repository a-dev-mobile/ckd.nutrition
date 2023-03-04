import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrition/features/splash/splash.dart';


class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  static const path = '/splash';
  static const name = 'splash';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(splashProvider);
    

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Align(
            child: Text('load'),
          ),
          const Positioned(
            bottom: 30,
            child: Text('AppPageLoad'),
          ),
        ],
      ),
    );
  }
}
