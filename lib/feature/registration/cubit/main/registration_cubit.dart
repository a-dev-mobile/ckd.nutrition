// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names, lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
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
          RegistrationState(
         
            heightList: _initHeight(),
            diabetesSelected:
                List<bool>.filled(EnumDiabetes.values.length - 1, false),
          ),
        );

  final DaDataClient _clienTips;

  final AppRouter _go;

  final AppStorage _storage;

  
  

  static const _MIN_HEIGHT = 50;
  static const _MAX_HEIGHT = 220;

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


  static List<String> _initHeight() {
    final list = <String>[];
    for (var i = _MAX_HEIGHT; i > _MIN_HEIGHT; i--) {
      list.add(i.toString());
    }

    return list;
  }

  Future<List<String>> getSuggestionsName(String value) async {
    FioTooltip result;

    if (_locale == LocaleEnum.ru) {
      result = await _clienTips.fetchFioTooltip(value, DaDataEnum.name);

      return _getTips(result);
    }

    return [];
  }

  void checkHeight(String? value) {
    final valid = ValidHeight.dirty(value);
    emit(
      state.copyWith(
        validHeight: valid,
      ),
    );
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




  void checkHypertension(int index) {
    final value = EnumHypertension.values[index];

    final valid = ValidHypertension.dirty(value);

    final listBool = value.map(
      yes: () => [true, false],
      no: () => [false, true],
      none: () => [false, false],
    );

    emit(
      state.copyWith(
        hypertensionSelected: listBool,
        validHypertension: valid,
      ),
    );
  }

  void checkDiabetes(int index) {
    final value = EnumDiabetes.values[index];

    final valid = ValidDiabetes.dirty(value);

    final listBool = value.map(
      yes: () => [true, false],
      no: () => [false, true],
      none: () => [false, false],
    );

    emit(
      state.copyWith(
        diabetesSelected: listBool,
        validDiabetes: valid,
      ),
    );
  }

  void checkDailyDiuresis(int value) {
    final valueEnum = EnumDailyDiuresis.values[value];

    final valid = ValidDailyDiuresis.dirty(valueEnum);

    var listBoolSelected = <bool>[];

    listBoolSelected = _getListBoolByIndexTrue(indexTrue: valueEnum.index);
    emit(
      state.copyWith(
        dailyDiuresisSelected: listBoolSelected,
        validDailyDiuresis: valid,
        isVisibleUrineOutput: valueEnum == EnumDailyDiuresis.unknown,
      ),
    );
  }


  static List<bool> _getListBoolByIndexTrue({required int? indexTrue}) {
    final list = <bool>[];

    for (var i = 0; i < EnumCkd.values.length - 1; i++) {
      if (i == indexTrue) {
        list.add(true);
      } else {
        list.add(false);
      }
    }

    return list;
  }

  void checkActivity(int value) {
    final enumValue = EnumActivity.values[value];

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


  void checkWeight(String value) {
    if (value.isEmpty) {
      emit(
        state.copyWith(
          validWeight: const ValidWeight.dirty(
            externalError: ValidWeightError.isEmpty,
          ),
        ),
      );

      return;
    }

    final doubleValue = double.tryParse(value);

    ValidWeight validWeight;

    validWeight = doubleValue == null
        ? const ValidWeight.dirty(
            externalError: ValidWeightError.isNoValid,
          )
        : ValidWeight.dirty(value: doubleValue);

    emit(
      state.copyWith(
        validWeight: validWeight,
      ),
    );
  }

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
    final validWeight = ValidWeight.dirty(value: state.validWeight.value);
  

    final validHypertension =
        ValidHypertension.dirty(state.validHypertension.value);

    final validDiabetes = ValidDiabetes.dirty(state.validDiabetes.value);

    final validActivity = ValidActivity.dirty(state.validActivity.value);


    final validHeight = ValidHeight.dirty(state.validHeight.value);
  
    final validDailyDiuresis =
        ValidDailyDiuresis.dirty(state.validDailyDiuresis.value);



    final validUrineOutput =
        ValidUrineOutput.dirty(value: state.validUrineOutput.value);

    final listValidate = <FormzInput<dynamic, dynamic>>[
      validName,
      validHypertension,
      validDiabetes,

      validActivity,

      validHeight,
      validWeight,

      validDailyDiuresis,

      if (state.isVisibleUrineOutput) validUrineOutput,
    ];

    emit(
      state.copyWith(
        validActivity: validActivity,
        validName: validName,
 
        validDiabetes: validDiabetes,
        validHypertension: validHypertension,

        validHeight: validHeight,
        validWeight: validWeight,

        validDailyDiuresis: validDailyDiuresis,
        validUrineOutput: validUrineOutput,
        isValid: Formz.validate(listValidate),
      ),
    );
//  error enumeration and display

    return state.isValid;
  }
}
