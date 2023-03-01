import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nutrition/core/utils/utils.dart';

import 'package:nutrition/core/valid/valid.dart';
import 'package:nutrition/feature/registration/registration.dart';

part 'ckd_state.dart';

class CkdCubit extends HydratedCubit<CkdState> {
  CkdCubit()
      : super(
          CkdState(
            ckdSelected: List<bool>.filled(EnumCkd.values.length - 1, false),
          ),
        );

  void checkCkd(int value) {
    final enumValue = EnumCkd.values[value];

    final validCkd = ValidCkd.dirty(enumValue);

    var ckdSelected = <bool>[];

    ckdSelected = ListUtils.getListBoolByIndexTrue(
      length: EnumCkd.values.length,
      indexTrue: enumValue.index,
    );
    emit(
      state.copyWith(
        ckdSelected: ckdSelected,
        isVisibleCreatinine: enumValue == EnumCkd.calculate,
      ),
    );

    _checkValid(validCkd: validCkd);
  }

  void changeTypeCreatinine(EnumInputTypeCreatinine? v) {
    emit(state.copyWith(inputTypeCreatinine: v));
  }

  void checkCreatinine({
    required bool isValidBirthday,
    required bool isValidGender,
    String? v,
  }) {
    v ??= state.validCreatinine.value.toString();

    // подбираю ошибки
    ValidCreatinineError? error;
    if (!isValidBirthday) error = ValidCreatinineError.noBirthday;
    if (!isValidGender) error = ValidCreatinineError.noGender;
    if (v.isEmpty) error = ValidCreatinineError.isEmpty;

    final doubleValue = double.tryParse(v);
// если не получитьсь в double - ошибка
    if (doubleValue == null) error = ValidCreatinineError.isNoValid;

// если выбрано определить GFR (клубочковую фильтрацию) то проверяем валидацию
    final validCreatinine = state.validCkd.value.maybeMap(
      orElse: ValidCreatinine.pure,
      calculate: () =>
          ValidCreatinine.dirty(value: doubleValue, externalError: error),
    );

    _checkValid(validCreatinine: validCreatinine);
  }

  void _checkValid({
    ValidCreatinine? validCreatinine,
    ValidCkd? validCkd,
  }) {
    validCkd ??= ValidCkd.dirty(state.validCkd.value);
    validCreatinine ??=
        ValidCreatinine.dirty(value: state.validCreatinine.value);

    emit(
      state.copyWith(
        validCkd: validCkd,
        validCreatinine: validCreatinine,
        isValid: Formz.validate([validCkd, validCreatinine]),
      ),
    );
  }

  @override
  CkdState? fromJson(Map<String, dynamic> json) {
    return CkdState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CkdState state) {
    return state.toMap();
  }

  void goAbouCkd() {
  }
}
