// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names, lines_longer_than_80_chars

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:nutrition/core/valid/valid.dart';
import 'package:nutrition/feature/registration/registration.dart';

part 'brithday_state.dart';

class BrithdayCubit extends HydratedCubit<BrithdayState> {
  BrithdayCubit()
      : super(BrithdayState(
          dateRegModel: DateRegModel(
            days: _initDayMonth(start: 1, end: _maxDayInMonth),
            months: _initDayMonth(start: 1, end: _maxMonth),
            years: _initYears(),
          ),
        ),);

  static const _maxDayInMonth = 31;
  static const _maxMonth = 12;

  static const _MIN_AGE = 13;
  static const _MAX_AGE = 100;

  static List<String> _initYears() {
    final listYear = <String>[];
    final yearStart = DateTime.now().year - _MAX_AGE;
    final yearEnd = DateTime.now().year - _MIN_AGE;
    for (var i = yearEnd; i > yearStart; i--) {
      listYear.add(i.toString());
    }

    return listYear;
  }

  static List<String> _initDayMonth({required int start, required int end}) {
    final list = <String>[];
    for (var i = start; i <= end; i++) {
      if (i < 10) {
        list.add('0$i');
        continue;
      }

      list.add(i.toString());
    }

    return list;
  }

  String _getDateRaw() {
    final day = state.daySelected;
    final monthNumber = state.monthSelected;
    final year = state.yearSelected;

    if (day != null && monthNumber != null && year != null) {
      return '$year-$monthNumber-$day';
    }

    return '';
  }

  void changeDay(String? value) {
    emit(state.copyWith(daySelected: value));
    checkValid();
  }

  void changeMonth(String? value) {
    emit(state.copyWith(monthSelected: value));
    checkValid();
  }

  void changeYear(String? value) {
    emit(state.copyWith(yearSelected: value));
    checkValid();
  }

  void checkValid({ValidBirthday? validBirthday}) {
    validBirthday ??= ValidBirthday.dirty(_getDateRaw());

    emit(
      state.copyWith(
        validBirthday: validBirthday,
        isValid: Formz.validate([validBirthday]),
      ),
    );
  }

  @override
  BrithdayState? fromJson(Map<String, dynamic> json) {
    return BrithdayState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(BrithdayState state) {
    return state.toMap();
  }
}
