// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorageService {
  AppLocalStorageService({
    required SharedPreferences pref,
    bool isShowLog = false,
  })  : _isShowLog = isShowLog,
        _pref = pref;

  final SharedPreferences _pref;

  final bool _isShowLog;

  static const String _info = '';

  static const String _set = '💾 👇🏻SET';
  static const String _get = '💾 ☝🏻 GET';

// ******************************
  static const _firstStart = '_first_start';
  bool isFirstStart() {
    return getBool(key: _firstStart, defValue: true);
  }

  void completeFirstStart() {
    return setBool(key: _firstStart, value: false);
  }
// ******************************

  static const _completeOnboarding = 'completed_onboarding';

  bool isOnboardingCompleted() {
    return getBool(key: _completeOnboarding);
  }

  void completeOnboarding() {
    return setBool(key: _completeOnboarding, value: true);
  }

// ******************************
  static const _locale = 'locale';

  String getLocale() {
    return getString(key: _locale);
  }

  void setLocale(String locale) {
    return setString(key: _locale, value: locale);
  }

// ******************************
  static const _theme = 'theme';

  String getTheme() {
    return getString(key: _theme);
  }

  void setTheme(String value) {
    return setString(key: _theme, value: value);
  }

// ******************************
  static const _db_patch = '_db_patch';

  String getDbPatch() {
    return getString(key: _db_patch);
  }

  void setDbPatch(String path) {
    return setString(key: _db_patch, value: path);
  }

// ******************************
  // static const _db_zip_patch = '_db_zip_patch';

  // Future<String> getDbZipPatch() {
  //   return getString(key: _db_zip_patch);
  // }

  // void setDbZipPatch(String path) {
  //   return setString(key: _db_zip_patch, value: path);
  // }

// ******************************
// ******************************
  static const _db_version = '_db_version';

  int getDbUpdateVersion() {
    return getInt(key: _db_version);
  }

  void setDbVersion(int value) {
    return setInt(key: _db_version, value: value);
  }

// ******************************

  static const _lastSearchList = 'saved_list';

  List<String> getListSearch() {
    return getStringList(key: _lastSearchList);
  }

  void setLastSearch(String v) {
    final value = v.trim();
    final list = getStringList(key: _lastSearchList);

    final growableList = List<String>.empty(growable: true)..addAll(list);

    if (growableList.contains(value)) final _ = growableList.remove(value);

    growableList.add(value);

    setStringList(key: _lastSearchList, value: growableList);
  }
// ******************************

  static const _favoriteList = '_favoriteList';

  List<String> getFavorite() {
    return getStringList(key: _favoriteList);
  }

  void addFavorite(List<String> value) {
    setStringList(key: _favoriteList, value: value);
  }
// ******************************

  static const _path_db_update = '_path_db_update';

  List<String> getPathUpdateFilesDb() {
    return getStringList(key: _path_db_update);
  }

  List<String> getNameUpdateFilesDb() {
    final list = getPathUpdateFilesDb();

    final names = <String>[];
    for (final i in list) {
      names.add(i.split('/').last.split('.').first);
    }

    return getStringList(key: _path_db_update);
  }

  void setPathUpdateFilesDb(List<String> value) {
    return setStringList(key: _path_db_update, value: value);
  }
// ******************************

// ******************************
// ******************************

  static const _categories = 'categories';

  List<String> getSelectedCategories() {
    return getStringList(key: _categories);
  }

  void setSelectedCategories(List<String> value) {
    return setStringList(key: _categories, value: value);
  }

// ******************************

// ******************************
// ******************************
  /// SaveString.
  void setString({required String key, required String value}) {
    final result = _pref.setString(key, value);
    if (_isShowLog) {
      log('$_set $_info > $key\nvalue = $value\nresult = $result');
    }
  }

  void setStringList({
    required String key,
    required List<String> value,
  }) {
    final _ = _pref.setStringList(key, value);
    if (_isShowLog) {
      log('$_set $_info > $key\nvalue = $value');
    }
  }

  void setJson({
    required String key,
    required Map<String, dynamic> value,
  }) {
    final _ = _pref.setString(key, jsonEncode(value));
    if (_isShowLog) {
      log('$_set $_info > $key\nvalue = $value');
    }
  }

  /// SaveBool.
  void setBool({required String key, required bool value}) {
    final _ = _pref.setBool(key, value);
    if (_isShowLog) {
      log('$_set $_info > $key\nvalue = $value');
    }
  }

  /// SaveDouble.
  void setDouble({required String key, required double value}) {
    final _ = _pref.setDouble(key, value);
    if (_isShowLog) {
      log('$_set $_info > $key\nvalue = $value');
    }
  }

  /// SaveInt.
  void setInt({required String key, required int value}) {
    final _ = _pref.setInt(key, value);
    if (_isShowLog) {
      log('$_set $_info > $key\nvalue = $value');
    }
  }

  Map<String, dynamic> getJson({
    required String key,
  }) {
    final result =
        jsonDecode(_pref.getString(key) ?? '{}') as Map<String, dynamic>;

    if (_isShowLog) {
      log('$_get $_info > $key\nvalue = $result');
    }

    return result;
  }

  /// GetString.
  String getString({
    required String key,
    String defaultValue = '',
  }) {
    final result = _pref.getString(key) ?? defaultValue;
    if (_isShowLog) {
      log('$_get $_info > $key\nvalue = $result');
    }

    return result;
  }

  /// GetListString.
  List<String> getStringList({required String key}) {
    final result = _pref.getStringList(key) ?? List.empty();
    if (_isShowLog) {
      log('$_get $_info > $key\nvalue = $result');
    }

    return result;
  }

  /// GetInt.
  int getInt({required String key, int defaultValue = 0}) {
    final result = _pref.getInt(key) ?? defaultValue;
    if (_isShowLog) {
      log('$_get $_info > $key\nvalue = $result');
    }

    return result;
  }

  /// GetDouble.
  double getDouble({
    required String key,
    double defaultValue = 0,
  }) {
    final result = _pref.getDouble(key) ?? defaultValue;
    if (_isShowLog) {
      log('$_get $_info > $key\nvalue = $result');
    }

    return result;
  }

  /// GetBoolData.
  bool getBool({required String key, bool defValue = false}) {
    final result = _pref.getBool(key) ?? defValue;
    if (_isShowLog) {
      log('$_get $_info > $key\nvalue = $result');
    }

    return result;
  }

  /// IsNull.
  bool isNull(String key) {
    final val = _pref.get(key);
    bool result;

    // ignore: avoid_bool_literals_in_conditional_expressions
    result = val == null ? true : false;
    if (_isShowLog) {
      log(
        '$_get  $_info | isNull \nresult = $result \nkey = $key \nvalue = $val',
      );
    }

    return result;
  }

  /// ClearAll.
  Future<void> clearAll() async {
    final result = await _pref.clear();

    if (_isShowLog) log('CLEAR $_info > result = $result');
  }
}
