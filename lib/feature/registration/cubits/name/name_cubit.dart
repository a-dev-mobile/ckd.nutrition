// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names, lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';

import 'package:dadata/dadata.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nutrition/core/enum/enum.dart';

import 'package:nutrition/core/storage/storage.dart';

import 'package:nutrition/core/valid/valid.dart';
import 'package:nutrition/feature/registration/registration.dart';

part 'name_state.dart';

class NameCubit extends HydratedCubit<NameState> {
  NameCubit({
    required DaDataClient clienTips,
    required AppStorage storage,
  })  : _clienTips = clienTips,
        _storage = storage,
        super(
          const NameState(),
        );

  final DaDataClient _clienTips;

  final AppStorage _storage;

  EnumLang _locale = EnumLang.en;
  void load() {
    _locale = EnumLang.fromValue(
      _storage.getLocale(),
      fallback: EnumLang.en,
    );
  }

  Future<List<String>> getSuggestionsName(String value) async {
    FioTooltip result;

    if (_locale == EnumLang.ru) {
      result = await _clienTips.fetchFioTooltip(value, DaDataEnum.name);

      return _getTips(result);
    }

    return [];
  }

  void checkName(String value) {
    final validName = ValidName.dirty(value);
    emit(
      state.copyWith(
        validName: validName,
        isValid: Formz.validate([validName]),
      ),
    );
  }

  List<String> _getTips(FioTooltip result) {
    final list = <String>[];
    final length = result.suggestions.length;
    if (length == 0) return list;

    for (var i = 0; i < length; i++) {
      list.add(
        result.suggestions[i].value,
      );
    }

    return list;
  }

  @override
  NameState? fromJson(Map<String, dynamic> json) {
    return NameState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(NameState state) {
    return state.toMap();
  }
}
