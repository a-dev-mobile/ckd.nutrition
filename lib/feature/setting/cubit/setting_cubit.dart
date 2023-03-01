// ignore_for_file: sort_constructors_first
// ignore_for_file: public_member_api_docs,  lines_longer_than_80_chars

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:nutrition/app/common/common.dart';
import 'package:nutrition/feature/registration/registration.dart';
import 'package:nutrition/navigation/navigation.dart';
part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit({
    required ThemeCubit cubitTheme,
    required LangCubit cubitLocale,
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
  final LangCubit _cubitLocale;
  // ignore: unused_field
  final AppRouter _go;

  void load() {
    final locale = _cubitLocale.state;
    final theme = _cubitTheme.state;
    var boolsLocale = state.boolsLocale;
    var boolsTheme = state.boolsTheme;

    boolsTheme = theme == ThemeMode.light ? [true, false] : [false, true];

    boolsLocale = locale == EnumLang.ru ? [false, true] : [true, false];

    emit(state.copyWith(boolsLocale: boolsLocale, boolsTheme: boolsTheme));
  }

  void changeLocale(int index) {
    final localeActive = index == 0 ? EnumLang.en : EnumLang.ru;

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
