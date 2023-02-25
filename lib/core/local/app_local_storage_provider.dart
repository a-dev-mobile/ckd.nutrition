import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrition/core/config/providers.dart';
import 'package:nutrition/core/local/storage.dart';

final appLocalStorageProvider = Provider((ref) {
  final sp = ref.read(sharedPreferencesProvider);

  return AppLocalStorageService(pref: sp);
});
