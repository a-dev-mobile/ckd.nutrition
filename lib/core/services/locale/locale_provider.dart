import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nutrition/core/enum/locale_enum.dart';
import 'package:nutrition/core/services/storage/app_storage_service.dart';

final localeProvider = StateNotifierProvider<LocaleNotifier, LocaleEnum>((ref) {
  final storage = ref.watch(appStorageServiceProvider);

  return LocaleNotifier(storage: storage);
});

class LocaleNotifier extends StateNotifier<LocaleEnum> {
  LocaleNotifier({required this.storage})
      : super(LocaleEnum.fromValue(storage.getLocale()));
  final AppStorageService storage;

  void setLocale(LocaleEnum locale) {
    state = locale;
    unawaited(storage.setLocale(locale.value));
  }

  void changeLocale() {
    final newLocale = state == LocaleEnum.en ? LocaleEnum.ru : LocaleEnum.en;
    setLocale(newLocale);
  }
}
