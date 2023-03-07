// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names, lines_longer_than_80_chars

import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nutrition/core/services/dadata/dadata.dart';
import 'package:nutrition/core/services/storage/app_storage_service.dart';
import 'package:nutrition/core/valid/field_string_valid.dart';

import 'package:nutrition/features/registration/name/name.dart';

part 'registration_name_state.dart';

final registrationNameProvider = StateNotifierProvider.autoDispose<
    RegistrationNameNotifier, RegistrationNameState>(
  (ref) {
    return RegistrationNameNotifier(
      dadataService: ref.watch(dadataServiceProvider),
      storage: ref.watch(appStorageServiceProvider),
    );
  },
);

class RegistrationNameNotifier extends StateNotifier<RegistrationNameState> {
  RegistrationNameNotifier({
    required DaDataService dadataService,
    required AppStorageService storage,
  })  : _dadataService = dadataService,
        _storage = storage,
        super(
          const RegistrationNameState(),
        );

  final DaDataService _dadataService;

  final AppStorageService _storage;

  void setName(String value) {
    final nameState = state.copyWith(nameValid: FieldStringValid(value: value));

    late FieldStringValid nameValid;

    if (value.isEmpty) {
      nameValid = nameState.nameValid.copyWith(
        value: value,
        errorMessage: 'EMPTY',
        isValid: false,
      );
      //
    } else if (value.validName()) {
      nameValid = nameState.nameValid.copyWith(isValid: true, value: value);
      //
    } else if (value.maxSymbol(20)) {
      nameValid = nameState.nameValid
          .copyWith(isValid: false, errorMessage: 'maxsymbol', value: value);
      //
    } else {
      nameValid = nameState.nameValid
          .copyWith(isValid: false, errorMessage: 'ERROR', value: value);
    }

    state = state.copyWith(nameValid: nameValid);
  }

  void cleanName() {
    late FieldStringValid nameValid;

    state = state.copyWith(
      nameValid: FieldStringValid(),
    );
  }

  FutureOr<Iterable<String>> getSuggestionsName(String pattern) {
    // FioTooltip result;

    // result = await _dadataService.fetchFioTooltip(value, DaDataEnum.name);

    // return _getTips(result);

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
