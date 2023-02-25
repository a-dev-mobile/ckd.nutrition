import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrition/core/local/app_local_storage_provider.dart';
import 'package:nutrition/core/router/router.dart';
import 'package:nutrition/feature/splash/splash.dart';

final splashProvider =
    StateNotifierProvider.autoDispose<SplashController, SplashState>(  (ref) {
  final router = ref.read(appRouterProvider);
  final storage = ref.read(appLocalStorageProvider);

  return SplashController(router: router, storage: storage)..load();
});
