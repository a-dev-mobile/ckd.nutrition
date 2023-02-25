import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nutrition/core/widget/widget.dart';
import 'package:nutrition/feature/splash/providers.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  static const path = '/splash';
  static const name = 'splash';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    print('build');
    
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Align(
            child: AppLogo(),
          ),
          const Positioned(
            bottom: 30,
            child: AppPageLoad(),
          ),
        ],
      ),
    );
  }
}
