import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrition/core/config/providers.dart';
import 'package:nutrition/core/config/theme/application/theme_controller.dart';
import 'package:nutrition/core/local/app_local_storage_provider.dart';

final themeProvider = StateNotifierProvider<ThemeController, ThemeMode>(
  (ref) => ThemeController(storage: ref.read(appLocalStorageProvider)),
);
