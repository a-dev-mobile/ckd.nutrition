
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nutrition/app/common/common.dart';
import 'package:nutrition/core/storage/app_storage.dart';

class LangCubit extends Cubit<EnumLang> {
  LangCubit({required AppStorage storage})
      : _storage = storage,
        super(EnumLang.fromValue(Platform.localeName));
  final AppStorage _storage;

  void load() {
    final selectedLocale = _storage.getLocale();
    if (selectedLocale.isNotEmpty) {
      setLocale(EnumLang.fromValue(selectedLocale));
    } else {
      _storage.setLocale(state.value);
      setLocale(state);
    }
  }

  ///
  void setLocale(EnumLang locale) {
    emit(locale);
    _storage.setLocale(locale.value);
  }

  ///
  void changeLocale() {
    state == EnumLang.en ? setLocale(EnumLang.ru) : setLocale(EnumLang.en);
  }
}
