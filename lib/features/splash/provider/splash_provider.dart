import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';
import 'package:nutrition/core/services/navigation/navigation.dart';
import 'package:nutrition/core/services/storage/app_storage_service.dart';

part 'splash_state.dart';

final splashProvider =
    StateNotifierProvider.autoDispose<SplashNotifier, SplashState>((ref) {
  return SplashNotifier(
    router: ref.watch(appRouterServiceProvider),
    storage: ref.watch(appStorageServiceProvider),
  )..load();
});

class SplashNotifier extends StateNotifier<SplashState> {
  SplashNotifier({
    required AppRouterService router,
    required AppStorageService storage,
  })  : _go = router,
        _storage = storage,
        super(const SplashState.load());
  final AppStorageService _storage;
  final AppRouterService _go;
  Future<void> load() async {


    await Future<void>.delayed(const Duration(seconds: 1));
    final appState = _storage.getAppState();

    await _go.nextPage(appState);

    state = const SplashState.success();
  }
}
