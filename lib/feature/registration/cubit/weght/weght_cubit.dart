// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names, lines_longer_than_80_chars

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:nutrition/core/valid/valid.dart';
import 'package:nutrition/feature/registration/registration.dart';

part 'weght_state.dart';

class WeghtCubit extends HydratedCubit<WeghtState> {
  WeghtCubit() : super(const WeghtState());

  void checkWeight({String v = '', bool isCheckFromPage = false}) {
    var value = v;
//  checking from page
    if (isCheckFromPage) {
      final weight = state.validWeight.value;
      value = weight == null ? '' : weight.toString();
    }

    ValidWeightError? externalError;
    double? doubleValue;
    // проверка если
    if (value.isEmpty) {
      externalError = ValidWeightError.isEmpty;
    } else {
      doubleValue = double.tryParse(value);
      externalError = doubleValue == null ? ValidWeightError.isNoValid : null;
    }

    final validWeight =
        ValidWeight.dirty(value: doubleValue, externalError: externalError);

    emit(
      state.copyWith(
        validWeight: validWeight,
        isValid: Formz.validate([validWeight]),
      ),
    );
  }

  @override
  WeghtState? fromJson(Map<String, dynamic> json) {
    return WeghtState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(WeghtState state) {
    return state.toMap();
  }
}
