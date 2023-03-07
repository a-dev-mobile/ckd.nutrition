// ignore_for_file: sort_constructors_first

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrition/core/services/storage/app_storage_service.dart';
import 'package:nutrition/features/debug_menu/provider/debug_state.dart';

final debugProvider = StateNotifierProvider<DebugProvider, DebugState>((ref) {
  return DebugProvider(storage: ref.watch(appStorageServiceProvider));
});

class DebugProvider extends StateNotifier<DebugState> {
  DebugProvider({required AppStorageService storage})
      : _storage = storage,
        super(storage.getDebugState());

  final AppStorageService _storage;

  void setDevicePreview({required bool isShow}) {
    state = state.copyWith(isShowDevice: isShow);
    _saveLocal();
  }

  void setShowBtnHttpLog({required bool isShow}) {
    state = state.copyWith(isShowBtnHttpLog: isShow);
    _saveLocal();
  }

  void setShowDebugRepaintRainbow({required bool isShow}) {
    state = state.copyWith(isShowRepaintRainbow: isShow);
    _saveLocal();
  }

  void setShowPaintSizeEnabled({required bool isShow}) {
    state = state.copyWith(isShowPaintSizeEnabled: isShow);
    _saveLocal();
  }

  void _saveLocal() {
    _storage.setDebugState(state);
  }
}
