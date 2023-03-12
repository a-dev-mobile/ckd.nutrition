import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrition/core/services/navigation/app_router_service.dart';
import 'package:nutrition/core/services/storage/app_storage_service.dart';
import 'package:nutrition/features/onboarding/provider/onboarding_state.dart';
import 'package:nutrition/features/registration/name/name.dart';

final onboardingProvider =
    StateNotifierProvider.autoDispose<OnboardingNotifier, OnboardingState>(
        (ref) {
  return OnboardingNotifier(
    router: ref.watch(appRouterServiceProvider),
    storage: ref.watch(appStorageServiceProvider),
  );
});

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier({
    required AppRouterService router,
    required AppStorageService storage,
  })  : _go = router,
        _storage = storage,
        super(const OnboardingState.init());
  final AppStorageService _storage;
  final AppRouterService _go;
  void complectOnboarding() {
    _storage.setAppState(
      _storage.getAppState().copyWith(isOnboardingCompleted: true),
    );

    _go.router.goNamed(RegistrationNamePage.name);
  }
}
