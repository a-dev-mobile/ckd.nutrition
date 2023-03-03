// ignore_for_file: sort_constructors_first

part of 'debug_cubit.dart';

@immutable
class DebugState {
  /* init: false */
  final bool isShowDevice;
  /* init: false */
  final bool isShowBtnHttpLog;
  /* init: false */
  final bool isShowRepaintRainbow;
  /* init: false */
  final bool isShowPaintSizeEnabled;
  // end

//          --TURN_GEN--
//  *************************************
//           GENERATED CODE
//  *************************************

  const DebugState({
    this.isShowDevice = false,
    this.isShowBtnHttpLog = false,
    this.isShowRepaintRainbow = false,
    this.isShowPaintSizeEnabled = false,
  });
  /*
   factory DebugState.init() => DebugState(
      ); 
  */
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isShowDevice': isShowDevice,
      'isShowBtnHttpLog': isShowBtnHttpLog,
      'isShowRepaintRainbow': isShowRepaintRainbow,
      'isShowPaintSizeEnabled': isShowPaintSizeEnabled,
    };
  }

  factory DebugState.fromMap(Map<String, dynamic> map) {
    return DebugState(
      isShowDevice: map['isShowDevice'] as bool? ?? false,
      isShowBtnHttpLog: map['isShowBtnHttpLog'] as bool? ?? false,
      isShowRepaintRainbow: map['isShowRepaintRainbow'] as bool? ?? false,
      isShowPaintSizeEnabled: map['isShowPaintSizeEnabled'] as bool? ?? false,
    );
  }

  DebugState copyWith({
    bool? isShowDevice,
    bool? isShowBtnHttpLog,
    bool? isShowRepaintRainbow,
    bool? isShowPaintSizeEnabled,
  }) {
    return DebugState(
      isShowDevice: isShowDevice ?? this.isShowDevice,
      isShowBtnHttpLog: isShowBtnHttpLog ?? this.isShowBtnHttpLog,
      isShowRepaintRainbow: isShowRepaintRainbow ?? this.isShowRepaintRainbow,
      isShowPaintSizeEnabled:
          isShowPaintSizeEnabled ?? this.isShowPaintSizeEnabled,
    );
  }

  String toJson() => json.encode(toMap());
  factory DebugState.fromJson(String source) => DebugState.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DebugState &&
            (identical(other.isShowDevice, isShowDevice) ||
                other.isShowDevice == isShowDevice) &&
            (identical(other.isShowBtnHttpLog, isShowBtnHttpLog) ||
                other.isShowBtnHttpLog == isShowBtnHttpLog) &&
            (identical(other.isShowRepaintRainbow, isShowRepaintRainbow) ||
                other.isShowRepaintRainbow == isShowRepaintRainbow) &&
            (identical(other.isShowPaintSizeEnabled, isShowPaintSizeEnabled) ||
                other.isShowPaintSizeEnabled == isShowPaintSizeEnabled));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isShowDevice,
        isShowBtnHttpLog,
        isShowRepaintRainbow,
        isShowPaintSizeEnabled,
      ]);
  @override
  String toString() {
    return 'DebugState(isShowDevice: $isShowDevice, isShowBtnHttpLog: $isShowBtnHttpLog, isShowRepaintRainbow: $isShowRepaintRainbow, isShowPaintSizeEnabled: $isShowPaintSizeEnabled, )';
  }
}
