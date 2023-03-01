// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names, lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';


import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:nutrition/app/common/common.dart';
import 'package:nutrition/core/storage/storage.dart';
import 'package:nutrition/core/utils/utils.dart';

import 'package:nutrition/feature/markdown/markdown.dart';
import 'package:nutrition/feature/markdown/view/markdown_page.dart';

import 'package:nutrition/feature/setting/setting.dart';

import 'package:nutrition/navigation/navigation.dart';

part 'registration_state.dart';

class RegistrationCubit extends HydratedCubit<RegistrationState> {
  RegistrationCubit({
    required AppRouter router,
    required AppStorage storage,
  })  : _go = router,
        _storage = storage,
        super(
          const RegistrationState(),
        );

  final AppRouter _go;

  final AppStorage _storage;

  EnumLang _locale = EnumLang.en;
  void load() {
    emit(state.copyWith(isLoadPage: true));

    _locale = EnumLang.fromValue(
      _storage.getLocale(),
      fallback: EnumLang.en,
    );

    emit(state.copyWith(isLoadPage: false, isLoadNextPage: false));
  }

  void pushSetting() {
    _go.router.pushNamed(SettingPage.name);
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


  @override
  RegistrationState? fromJson(Map<String, dynamic> json) {
    return RegistrationState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(RegistrationState state) {
    return state.toMap();
  }

  void goAboutGender() {
    final url = _locale.map(
      ru: () =>
          'https://drive.google.com/uc?export=view&id=1Cl4YeeTYMFPIaz5NL1A29zF6jS6pgKpo',
      en: () =>
          'https://drive.google.com/uc?export=view&id=1Dj2pK8TetkIqxLQp_J8lLGspaEMpeJgB',
    );

    _go.router.pushNamed(
      MarkdownPage.name,
      queryParams: {'url': url},
    );
  }
}
