// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names, lines_longer_than_80_chars

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nutrition/core/valid/valid.dart';

import 'package:nutrition/feature/registration/registration.dart';

part 'height_state.dart';

class HeightCubit extends HydratedCubit<HeightState> {
  HeightCubit()
      : super(
          HeightState(
            heightList: _initheight(),
          ),
        );

  static const _MIN_HEIGHT = 50;
  static const _MAX_HEIGHT = 220;

  static List<String> _initheight() {
    final list = <String>[];
    for (var i = _MAX_HEIGHT; i > _MIN_HEIGHT; i--) {
      list.add(i.toString());
    }

    return list;
  }

/* 
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
 */
  void checkHeight({String? v, bool isCheckFromPage = false}) {
    var value = v;
    if (isCheckFromPage) {
      value = state.validheight.value;
    }
    final valid = ValidHeight.dirty(value);

    emit(
      state.copyWith(
        validheight: valid,
        isValid: Formz.validate([valid]),
      ),
    );
  }

  @override
  HeightState? fromJson(Map<String, dynamic> json) {
    return HeightState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(HeightState state) {
    return state.toMap();
  }
}
