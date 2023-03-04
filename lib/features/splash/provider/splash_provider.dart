import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

final splashProvider =
    StateNotifierProvider<SplashProvider, SplashState>((ref) {
  return SplashProvider();
});

class SplashProvider extends StateNotifier<SplashState> {
  SplashProvider() : super(const SplashState.load());

  Future<void> load() async {
    print('load');

    await Future<void>.delayed(Duration(seconds: 5));

    // _go.nextPage();

    state = const SplashState.success();
  }

  void change() {
    // state = state.copyWith(isLoad: !state.isLoad);
  }
}
