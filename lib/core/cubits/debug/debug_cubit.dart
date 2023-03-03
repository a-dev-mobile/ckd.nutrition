// ignore_for_file: sort_constructors_first
// ignore_for_file: public_member_api_docs, 
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'debug_state.dart';
class DebugCubit extends Cubit<DebugState> {
  DebugCubit()
      : super(
          const DebugState(),
        );

  void setDevicePreview({required bool isShow}) {
    emit(state.copyWith(isShowDevice: isShow));
  }

  void setShowBtnHttpLog({required bool isShow}) {
    emit(state.copyWith(isShowBtnHttpLog: isShow));
  }

  void setShowDebugRepaintRainbow({required bool isShow}) {
    emit(state.copyWith(isShowRepaintRainbow: isShow));
  }

  void setShowPaintSizeEnabled({required bool isShow}) {
    emit(state.copyWith(isShowPaintSizeEnabled: isShow));
  }
}
