import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nutrition/core/services/storage/app_storage_service.dart';
import 'package:nutrition/core/services/theme/theme_state.dart';

final themeProvider = StateNotifierProvider<ThemeController, ThemeState>(
  (ref) => ThemeController(storage: ref.read(appStorageServiceProvider)),
);

class ThemeController extends StateNotifier<ThemeState> {
  ThemeController({required AppStorageService storage})
      : _storage = storage,
        super(storage.getThemeState());

  final AppStorageService _storage;

  void changeTheme(ThemeMode theme) {
    final updateState = state.copyWith(themeMode: theme);
    _storage.setThemeState(updateState);

    state = updateState;
  }
}
