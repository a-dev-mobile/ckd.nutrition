// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names, lines_longer_than_80_chars

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nutrition/core/valid/valid.dart';

import 'package:nutrition/feature/registration/registration.dart';

part 'diabetes_state.dart';

class DiabetesCubit extends HydratedCubit<DiabetesState> {
  DiabetesCubit() : super(const DiabetesState());

  void checkDiabetes({int? v, bool isCheckFromPage = false}) {
    var value = v;

    if (isCheckFromPage) {
      value = state.validDiabetes.value.index;
    }

    final enumValue =
        value == null ? EnumDiabetes.none : EnumDiabetes.values[value];

    final validDiabetes = ValidDiabetes.dirty(enumValue);

     final listBool = enumValue.map(
      yes: () => [true, false],
      no: () => [false, true],
      none: () => [false, false],
    );

    emit(
      state.copyWith(
        diabetesSelected: listBool,
        validDiabetes: validDiabetes,
        isValid: Formz.validate([validDiabetes]),
      ),
    );
  }
   @override
  DiabetesState? fromJson(Map<String, dynamic> json) {
    return DiabetesState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(DiabetesState state) {
    return state.toMap();
  }
}
