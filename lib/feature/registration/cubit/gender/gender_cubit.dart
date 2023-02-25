import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

import 'package:nutrition/core/valid/valid.dart';
import 'package:nutrition/feature/registration/registration.dart';

part 'gender_state.dart';

class GenderCubit extends HydratedCubit<GenderState> {
  GenderCubit()
      : super(
          GenderState(
            genderSelected:
                List<bool>.filled(EnumGender.values.length - 1, false),
          ),
        );

  void checkGender(int value) {
    final gender = EnumGender.values[value];

    final validGender = ValidGender.dirty(gender);

    final genderSelected = gender.map(
      male: () => [false, true],
      female: () => [true, false],
      none: () => [false, false],
    );

    checkValid(validGender: validGender);

    emit(
      state.copyWith(
        genderSelected: genderSelected,
        
      ),
    );
  }

  void checkValid({ValidGender? validGender}) {
    validGender ??= ValidGender.dirty(state.validGender.value);

    emit(
      state.copyWith(
        validGender: validGender,
        isValid: Formz.validate([validGender]),
      ),
    );
  }

  @override
  GenderState? fromJson(Map<String, dynamic> json) {
    return GenderState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(GenderState state) {
    return state.toMap();
  }
}
