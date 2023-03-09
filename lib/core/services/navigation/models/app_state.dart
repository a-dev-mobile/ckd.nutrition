// ignore_for_file: sort_constructors_first, avoid_bool_literals_in_conditional_expressions
import 'dart:convert';

import 'package:meta/meta.dart';

@immutable
class AppState {
  /* init: true */
  final bool isFirstTime;
  /* init: false */
  final bool isOnboardingCompleted;

  // end

//          --TURN_GEN--
//             v0.3.0
//  *************************************
//           GENERATED CODE
//  *************************************

  const AppState({
    this.isFirstTime = true,
    this.isOnboardingCompleted = false,
  });
  /*
   factory AppState.init() => AppState(
      ); 
  */
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isFirstTime': isFirstTime,
      'isOnboardingCompleted': isOnboardingCompleted,
    };
  }

  factory AppState.fromMap(Map<String, dynamic>? map) {
    if (map == null) return const AppState();

    return AppState(
      isFirstTime:
          map['isFirstTime'] != null ? map['isFirstTime'] as bool : true,
      isOnboardingCompleted: map['isOnboardingCompleted'] != null
          ? map['isOnboardingCompleted'] as bool
          : false,
    );
  }

  AppState copyWith({
    bool? isFirstTime,
    bool? isOnboardingCompleted,
  }) {
    return AppState(
      isFirstTime: isFirstTime ?? this.isFirstTime,
      isOnboardingCompleted:
          isOnboardingCompleted ?? this.isOnboardingCompleted,
    );
  }

  String toJson() => json.encode(toMap());
  factory AppState.fromJson(String source) => AppState.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppState &&
            (identical(other.isFirstTime, isFirstTime) ||
                other.isFirstTime == isFirstTime) &&
            (identical(other.isOnboardingCompleted, isOnboardingCompleted) ||
                other.isOnboardingCompleted == isOnboardingCompleted));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isFirstTime,
        isOnboardingCompleted,
      ]);
  @override
  String toString() {
    return 'AppState(isFirstTime: $isFirstTime, isOnboardingCompleted: $isOnboardingCompleted, )';
  }
}
