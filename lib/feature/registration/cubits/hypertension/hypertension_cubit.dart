// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names, lines_longer_than_80_chars

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nutrition/core/valid/valid.dart';

import 'package:nutrition/feature/registration/registration.dart';

part 'hypertension_state.dart';

class HypertensionCubit extends HydratedCubit<HypertensionState> {
  HypertensionCubit() : super(const HypertensionState());

  void checkHypertension({int? v, bool isCheckFromPage = false}) {
    var value = v;

    if (isCheckFromPage) {
      value = state.validHypertension.value.index;
    }

    final enumValue =
        value == null ? EnumHypertension.none : EnumHypertension.values[value];

    final valid = ValidHypertension.dirty(enumValue);

    final listBool = enumValue.map(
      yes: () => [true, false],
      no: () => [false, true],
      none: () => [false, false],
    );

    emit(
      state.copyWith(
        hypertensionSelected: listBool,
        validHypertension: valid,
        isValid: Formz.validate([valid]),
      ),
    );
  }

  @override
  HypertensionState? fromJson(Map<String, dynamic> json) {
    return HypertensionState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(HypertensionState state) {
    return state.toMap();
  }
}
