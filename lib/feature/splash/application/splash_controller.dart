import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';
import 'package:nutrition/core/local/storage.dart';
import 'package:nutrition/core/router/router.dart';
import 'package:nutrition/feature/splash/splash.dart';

class SplashController extends StateNotifier<SplashState> {
  SplashController({
    required AppRouterService router,
    required AppLocalStorageService storage,
  })  : _go = router,
        _storage = storage,
        super(const SplashState.init());

  final AppRouterService _go;
  final AppLocalStorageService _storage;
  Future<void> load() async {
    print('load');
    final _ = _storage.completeFirstStart();

    await Future<void>.delayed(Duration(seconds: 5));

    // _go.nextPage();

    state = const SplashState.success();
  }

  void change() {
    // state = state.copyWith(isLoad: !state.isLoad);
  }
}
