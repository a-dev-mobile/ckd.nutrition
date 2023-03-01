// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names, lines_longer_than_80_chars

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nutrition/core/valid/valid.dart';

import 'package:nutrition/feature/registration/registration.dart';

part 'activity_state.dart';

class ActivityCubit extends HydratedCubit<ActivityState> {
  ActivityCubit() : super(const ActivityState());

  void checkActivity({int? v, bool isCheckFromPage = false}) {
    var value = v;

    if (isCheckFromPage) {
      value = state.validActivity.value.index;
    }

    final enumValue =
        value == null ? EnumActivity.none : EnumActivity.values[value];

    final validActivity = ValidActivity.dirty(enumValue);

    final activitySelected = enumValue.map(
      light: () => [false, true],
      normal: () => [true, false],
      none: () => [false, false],
    );

    emit(
      state.copyWith(
        activitySelected: activitySelected,
        validActivity: validActivity,
        isValid: Formz.validate([validActivity]),
      ),
    );
  }

  @override
  ActivityState? fromJson(Map<String, dynamic> json) {
    return ActivityState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ActivityState state) {
    return state.toMap();
  }

  void goAboutActivity() {
  }
}
