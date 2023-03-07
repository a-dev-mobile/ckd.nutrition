// ignore_for_file: sort_constructors_first, avoid_bool_literals_in_conditional_expressions
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

@immutable
class ThemeState {              

  /* init: ThemeMode.dark */
  final ThemeMode themeMode;

  // end
   
//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  
  const ThemeState({
    this.themeMode = ThemeMode.dark,
  });
  /*
   factory ThemeState.init() => ThemeState(
      ); 
  */
Map<String, dynamic> toMap() {
  return <String, dynamic>{
      'themeMode': themeMode.index, 
    };
  }

    factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(
      themeMode: map['themeMode'] != null ? ThemeMode.values[map['themeMode'] as int] : ThemeMode.dark, 
    );
  }

  ThemeState copyWith({
    ThemeMode? themeMode,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode, 
    );
  }

  String toJson() => json.encode(toMap());  
factory ThemeState.fromJson(String source) => ThemeState.fromMap(json.decode(source) as Map<String, dynamic>,);  
      
  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ThemeState &&
            (identical(other.themeMode, themeMode) || other.themeMode == themeMode));
  }
  
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        themeMode,
]);
      @override
  String toString() {
    return 'ThemeState(themeMode: $themeMode, )';
    }

}
