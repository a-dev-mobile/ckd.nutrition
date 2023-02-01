// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:nutrition/app/app.dart';
import 'package:nutrition/feature/registration/registration.dart';
import 'package:nutrition/navigation/navigation.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit({
    required ThemeCubit cubitTheme,
    required LocaleCubit cubitLocale,
    required AppRouter router,
  })  : _cubitTheme = cubitTheme,
        _go = router,
        _cubitLocale = cubitLocale,
        super(
          SettingState(
            localeActive: cubitLocale.state,
            themeActive: cubitTheme.state,
          ),
        );

  final ThemeCubit _cubitTheme;
  final LocaleCubit _cubitLocale;
  // ignore: unused_field
  final AppRouter _go;

  void load() {
    final locale = _cubitLocale.state;
    final theme = _cubitTheme.state;
    var boolsLocale = state.boolsLocale;
    var boolsTheme = state.boolsTheme;

    boolsTheme = theme == ThemeMode.light ? [true, false] : [false, true];

    boolsLocale = locale == LocaleEnum.ru ? [false, true] : [true, false];

    emit(state.copyWith(boolsLocale: boolsLocale, boolsTheme: boolsTheme));
  }

  void changeLocale(int index) {
    final localeActive = index == 0 ? LocaleEnum.en : LocaleEnum.ru;

    final boolsLocale = state.boolsLocale;
    final result = _forEachResult(boolsLocale, index);

    emit(state.copyWith(boolsLocale: result, localeActive: localeActive));
    _cubitLocale.setLocale(localeActive);
  }

  List<bool> _forEachResult(List<bool> bools, int index) {
    for (var i = 0; i < bools.length; i++) {
      bools[i] = i == index;
    }

    return bools;
  }

  void changeTheme(int index) {
    final themeActive = index == 0 ? ThemeMode.light : ThemeMode.dark;

    _cubitTheme.toggleTheme(
      theme: themeActive,
    );

    final boolsTheme = state.boolsTheme;
    final result = _forEachResult(boolsTheme, index);

    emit(state.copyWith(boolsTheme: result, themeActive: themeActive));
  }

  void nextPage() {
    _go.router.pushNamed(RegistrationPage.name);
  }
}

@immutable
class SettingState {
  /* init: const[] */
  final List<bool> boolsLocale;
  /* init: const[] */
  final List<bool> boolsTheme;
  /* type:enum */
  final LocaleEnum localeActive;
  /* type:enum */
  final ThemeMode themeActive;

  // end

  //  ******************************
  // GENERATED CODE BELOW - DO NOT MODIFY
  //  ******************************

  const SettingState({
    this.boolsLocale = const [],
    this.boolsTheme = const [],
    required this.localeActive,
    required this.themeActive,
  });
  /*
   factory SettingState.init() => SettingState(
      ); 
  */

  SettingState copyWith({
    List<bool>? boolsLocale,
    List<bool>? boolsTheme,
    LocaleEnum? localeActive,
    ThemeMode? themeActive,
  }) {
    return SettingState(
      boolsLocale: boolsLocale ?? this.boolsLocale,
      boolsTheme: boolsTheme ?? this.boolsTheme,
      localeActive: localeActive ?? this.localeActive,
      themeActive: themeActive ?? this.themeActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'boolsLocale': boolsLocale,
      'boolsTheme': boolsTheme,
      'localeActive': localeActive.index,
      'themeActive': themeActive.index,
    };
  }

  factory SettingState.fromMap(Map<String, dynamic> map) {
    return SettingState(
      boolsLocale: (map['boolsLocale'] as List<dynamic>?)
              ?.map((e) => e as bool)
              .toList() ??
          const [],
      boolsTheme: (map['boolsTheme'] as List<dynamic>?)
              ?.map((e) => e as bool)
              .toList() ??
          const [],
      localeActive: LocaleEnum.values[map['localeActive'] as int],
      themeActive: ThemeMode.values[map['themeActive'] as int],
    );
  }
  @override
  String toString() {
    return 'SettingState(boolsLocale: $boolsLocale, boolsTheme: $boolsTheme, localeActive: $localeActive, themeActive: $themeActive, )';
  }

  String toJson() => json.encode(toMap());

  factory SettingState.fromJson(String source) =>
      SettingState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingState &&
            const DeepCollectionEquality()
                .equals(other.boolsLocale, boolsLocale) &&
            const DeepCollectionEquality()
                .equals(other.boolsTheme, boolsTheme) &&
            (identical(other.localeActive, localeActive) ||
                other.localeActive == localeActive) &&
            (identical(other.themeActive, themeActive) ||
                other.themeActive == themeActive));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(boolsLocale),
        const DeepCollectionEquality().hash(boolsTheme),
        localeActive,
        themeActive,
      ]);
}
