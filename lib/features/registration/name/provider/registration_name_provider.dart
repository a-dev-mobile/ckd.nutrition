// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names, lines_longer_than_80_chars

import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nutrition/core/services/dadata/dadata.dart';
import 'package:nutrition/core/services/storage/app_storage_service.dart';
import 'package:nutrition/core/valid/field_string_valid.dart';
import 'package:nutrition/core/valid/valid_extension.dart';
import 'package:nutrition/localization/localization.dart';

part 'registration_name_state.dart';

final registrationNameProvider = StateNotifierProvider.autoDispose<
    RegistrationNameNotifier, RegistrationNameState>(
  (ref) {
    return RegistrationNameNotifier(
      ref: ref,
    );
  },
);

class RegistrationNameNotifier extends StateNotifier<RegistrationNameState> {
  RegistrationNameNotifier({
    required Ref ref,
  })  : _ref = ref,
        _dadataService = ref.read(dadataServiceProvider),
        _storage = ref.read(appStorageServiceProvider),
        _loc = ref.watch(appLocalizationsProvider),
        super(
          ref.read(appStorageServiceProvider).getRegistrationNameState(),
        );

  // ignore: unused_field
  final Ref _ref;
  final DaDataService _dadataService;
  final AppStorageService _storage;
  final AppLocalizations _loc;

  void setName(String value) {
    if (value.isEmpty) {
      state = state.copyWith(
        nameValid: FieldStringValid(
          value: value,
          errorMessage: 'empty',
        ),
      );
      //
    } else if (value.minSymbol(1)) {
      state = state.copyWith(
        nameValid: FieldStringValid(
          value: value,
          errorMessage: 'min sum symbols',
        ),
      );
      //
    } else if (value.maxSymbol(10)) {
      state = state.copyWith(
        nameValid: FieldStringValid(
          value: value,
          errorMessage: _loc.max_text_length,
        ),
      );
      //
    } else {
      state = state.copyWith(
        nameValid: FieldStringValid(
          value: value,
          isValid: true,
        ),
      );
    }

    _storage.setRegistrationNameState(state);
  }

  void checkValid() {
    setName(state.nameValid.value);
  }

  Future<List<String>> getSuggestionsName(String value) async {
    // FioTooltip result;

    if (state.nameValid.isValid) {
      try {
        final result =
            await _dadataService.fetchFioTooltip(value, DaDataEnum.name);

        return result.suggestions.map((v) => v.value).toList();
      } on Exception {
        return [];
      }
    }

    return [];
  }

  // EnumLang _locale = EnumLang.en;
  // void load() {
  //   _locale = EnumLang.fromValue(
  //     _storage.getLocale(),
  //     fallback: EnumLang.en,
  //   );
  // }

  // Future<List<String>> getSuggestionsName(String value) async {
  //   FioTooltip result;

  //   if (_locale == EnumLang.ru) {
  //     result = await _clienTips.fetchFioTooltip(value, DaDataEnum.name);

  //     return _getTips(result);
  //   }

  //   return [];
  // }

  // void checkName(String value) {
  //   final validName = ValidName.dirty(value);
  //   emit(
  //     state.copyWith(
  //       validName: validName,
  //       isValid: Formz.validate([validName]),
  //     ),
  //   );
  // }

  // List<String> _getTips(FioTooltip result) {
  //   final list = <String>[];
  //   final length = result.suggestions.length;
  //   if (length == 0) return list;

  //   for (var i = 0; i < length; i++) {
  //     list.add(
  //       result.suggestions[i].value,
  //     );
  //   }

  //   return list;
  // }
}
