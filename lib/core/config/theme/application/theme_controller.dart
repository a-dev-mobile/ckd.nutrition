import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrition/core/config/theme/theme.dart';
import 'package:nutrition/core/local/doiman/app_local_storage_service.dart';

class ThemeController extends StateNotifier<ThemeMode> {
  ThemeController({required AppLocalStorageService storage})
      : _storage = storage,
        super(init(storage));

  static ThemeMode init(AppLocalStorageService storage) {
    return EnumTheme.fromValue(
      storage.getTheme(),
      fallback: EnumTheme.light,
    ).map(
      light: () => ThemeMode.light,
      dark: () => ThemeMode.dark,
    );
  }


  final AppLocalStorageService _storage;

  void changeTheme(EnumTheme theme) {
    _storage.setTheme(theme.value);
    switch (theme) {
      case EnumTheme.dark:
        state = ThemeMode.dark;
        break;
      case EnumTheme.light:
        state = ThemeMode.light;
        break;
    }
  }
}
