// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names, lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';


import 'package:dadata/dadata.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nutrition/app/app.dart';
import 'package:nutrition/core/storage/storage.dart';
import 'package:nutrition/core/utils/utils.dart';
import 'package:nutrition/core/valid/valid.dart';
import 'package:nutrition/feature/registration/registration.dart';
import 'package:nutrition/feature/setting/setting.dart';

import 'package:nutrition/navigation/navigation.dart';

part 'registration_state.dart';

class RegistrationCubit extends HydratedCubit<RegistrationState> {
  RegistrationCubit({
    required AppRouter router,
    required DaDataClient clienTips,
    required AppStorage storage,
  })  : _go = router,
        _clienTips = clienTips,
        _storage = storage,
        super(
          const RegistrationState(),
        );

  final DaDataClient _clienTips;

  final AppRouter _go;

  final AppStorage _storage;

  LocaleEnum _locale = LocaleEnum.en;
  Future<void> load() async {
    emit(state.copyWith(isLoadPage: true));

    _locale = LocaleEnum.fromValue(
      await _storage.getLocale(),
      fallback: LocaleEnum.en,
    );

    emit(state.copyWith(isLoadPage: false, isLoadNextPage: false));
  }

  void pushSetting() {
    _go.router.pushNamed(SettingPage.name);
  }

  Future<List<String>> getSuggestionsName(String value) async {
    FioTooltip result;

    if (_locale == LocaleEnum.ru) {
      result = await _clienTips.fetchFioTooltip(value, DaDataEnum.name);

      return _getTips(result);
    }

    return [];
  }

  void openPolicy() {
    const en =
        'https://docs.google.com/document/d/1HfAqwOAMXT_ntykDdwwFJYO8njz3ZVQCcW51SuYZhD0/edit?usp=sharing';

    const ru =
        'https://docs.google.com/document/d/1M-WG6WJdVx3Y2OtUi_3XwG4h_J1rZnnPPn_a38q6-OE/edit?usp=sharing';

    unawaited(
      _locale.map(
        ru: () => LaunchLinks.urlExternal(ru),
        en: () => LaunchLinks.urlInternal(en),
      ),
    );
  }

  void checkName(String value) {
    final validName = ValidName.dirty(value);
    emit(
      state.copyWith(
        validName: validName,
        // isValid: .validate([validName, state.validName,state.]),
      ),
    );
  }

  Future<void> nextPage() async {
    // emit(state.copyWith(isLoadNextPage: true));
    // final userInfo = UserInfoModel(
    //   name: state.validName.value,
    //   gender: state.validGender.value,
    //   activity: state.validActivity.value,
    //   birthday: DateTime.parse(state.validBirthday.value),
    //   height: int.tryParse(state.validHeight.value ?? '0') ?? 0,
    //   weight: state.validWeight.value ?? 0,
    //   ckd: state.validCkd.value,
    //   creatinin: state.validCreatinine.value ?? 0,
    //   created: DateTime.now(),
    //   updated: DateTime.now(),
    // );
    // await _storage.setUserInfoModel(userInfo);
    // await Future<void>.delayed(const Duration(seconds: 5));

    // _go.router.goNamed(DashBoardPage.name);
    // emit(state.copyWith(isLoadNextPage: false));
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
  RegistrationState? fromJson(Map<String, dynamic> json) {
    return RegistrationState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(RegistrationState state) {
    return state.toMap();
  }

  bool isValid() {
    final validName = ValidName.dirty(state.validName.value);

 

    final listValidate = <FormzInput<dynamic, dynamic>>[
      validName,

    
    ];

    emit(
      state.copyWith(
        validName: validName,
     
     
     
        isValid: Formz.validate(listValidate),
      ),
    );
//  error enumeration and display

    return state.isValid;
  }
}
