import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition/core/storage/app_storage.dart';
import 'package:nutrition/navigation/navigation.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit({
    required AppRouter router,
    required AppStorage storage,
  })  : _go = router,
        _storage = storage,
        super(OnboardingState());
  final AppStorage _storage;
  final AppRouter _go;
  void complectOnboarding() {
    _storage
      ..completeOnboarding()
      ..completeFirstStart();

    _go.nextPage();
    
  }
}

class OnboardingState {}
