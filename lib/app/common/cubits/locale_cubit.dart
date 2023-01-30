import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition/app/app.dart';
import 'package:nutrition/core/storage/app_storage.dart';

class LocaleCubit extends Cubit<LocaleEnum> {
  LocaleCubit({required AppStorage storage})
      : _storage = storage,
        super(LocaleEnum.fromValue(Platform.localeName));
  final AppStorage _storage;

  Future<void> load() async {
    final selectedLocale = await _storage.getLocale();
    if (selectedLocale.isNotEmpty) {
      setLocale(LocaleEnum.fromValue(selectedLocale));
    } else {
      unawaited(_storage.setLocale(state.value));
      setLocale(state);
    }
  }

  ///
  void setLocale(LocaleEnum locale) {
    emit(locale);
    _storage.setLocale(locale.value);
  }

  ///
  void changeLocale() {
    state == LocaleEnum.en
        ? setLocale(LocaleEnum.ru)
        : setLocale(LocaleEnum.en);
  }
}
