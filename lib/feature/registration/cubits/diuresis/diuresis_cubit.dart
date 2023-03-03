// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names, lines_longer_than_80_chars

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nutrition/core/utils/utils.dart';

import 'package:nutrition/feature/registration/registration.dart';

part 'diuresis_state.dart';

class DiuresisCubit extends HydratedCubit<DiuresisState> {
  DiuresisCubit() : super(const DiuresisState());

  void checkUrineOutput(String value) {
    if (value.isEmpty) {
      emit(
        state.copyWith(
          validUrineOutput: const ValidUrineOutput.dirty(
            externalError: ValidUrineOutputError.isEmpty,
          ),
        ),
      );

      return;
    }

    final doubleValue = double.tryParse(value);

    final validUrineOutput = doubleValue == null
        ? const ValidUrineOutput.dirty(
            externalError: ValidUrineOutputError.isNoValid,
          )
        : ValidUrineOutput.dirty(value: doubleValue);

    emit(
      state.copyWith(
        validUrineOutput: validUrineOutput,
      ),
    );
  }

  void checkDailyDiuresis(int value) {
    final valueEnum = EnumDailyDiuresis.values[value];

    final valid = ValidDailyDiuresis.dirty(valueEnum);

    var listBoolSelected = <bool>[];

    listBoolSelected = ListUtils.getListBoolByIndexTrue(
      length: EnumDailyDiuresis.values.length,
      indexTrue: valueEnum.index,
    );
    emit(
      state.copyWith(
        dailyDiuresisSelected: listBoolSelected,
        validDailyDiuresis: valid,
        isVisibleUrineOutput: valueEnum == EnumDailyDiuresis.unknown,
      ),
    );
  }

  // void checkDiuresis({int? v, bool isCheckFromPage = false}) {
  //   var value = v;

  //   if (isCheckFromPage) {
  //     value = state.validDiuresis.value.index;
  //   }

  //   final enumValue =
  //       value == null ? EnumDiuresis.none : EnumDiuresis.values[value];

  //   final validDiuresis = ValidDiuresis.dirty(enumValue);

  //   final listBool = enumValue.map(
  //     yes: () => [true, false],
  //     no: () => [false, true],
  //     none: () => [false, false],
  //   );

  //   emit(
  //     state.copyWith(
  //       diabetesSelected: listBool,
  //       validDiuresis: validDiuresis,
  //       isValid: Formz.validate([validDiuresis]),
  //     ),
  //   );
  // }

  @override
  DiuresisState? fromJson(Map<String, dynamic> json) {
    return DiuresisState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(DiuresisState state) {
    return state.toMap();
  }

  void goAboutDiuresis() {}
}
