// ignore_for_file: sort_constructors_first

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrition/features/debug_menu/provider/debug_state.dart';



final debugProvider = StateNotifierProvider<DebugProvider,DebugState>((ref) {
  return DebugProvider();
});


class DebugProvider extends StateNotifier<DebugState> {
  DebugProvider() : super(const DebugState());

  void setDevicePreview({required bool isShow}) {
    state = state.copyWith(isShowDevice: isShow);
  }

  void setShowBtnHttpLog({required bool isShow}) {
    state = state.copyWith(isShowBtnHttpLog: isShow);
  }

  void setShowDebugRepaintRainbow({required bool isShow}) {
    state = state.copyWith(isShowRepaintRainbow: isShow);
  }

  void setShowPaintSizeEnabled({required bool isShow}) {
    state = state.copyWith(isShowPaintSizeEnabled: isShow);
  }
}
