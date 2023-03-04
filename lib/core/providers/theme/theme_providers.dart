import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrition/core/providers/theme/enum_theme.dart';
import 'package:nutrition/core/providers/storage/app_storage_provider.dart';

final themeProvider = StateNotifierProvider<ThemeController, ThemeMode>(
  (ref) => ThemeController(storage: ref.read(appStorageProvider)),
);

class ThemeController extends StateNotifier<ThemeMode> {
  ThemeController({required AppStorage storage})
      : _storage = storage,
        super(init(storage));

  static ThemeMode init(AppStorage storage) {
    return EnumTheme.fromValue(
      storage.getTheme(),
      fallback: EnumTheme.light,
    ).mapConst(
      light: ThemeMode.light,
      dark: ThemeMode.dark,
    );
  }

  final AppStorage _storage;

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
