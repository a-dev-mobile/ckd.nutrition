// https://icomoon.io/app/#/select

// Place fonts/icomoon.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: icomoon
//      fonts:
//       - asset: fonts/icomoon.ttf
// ignore_for_file: constant_identifier_names

import 'package:flutter/widgets.dart';

/// AppIcon Singleton class
class AppIcon {
  factory AppIcon() => _internalSingleton;
  AppIcon._internal();
  static final AppIcon _internalSingleton = AppIcon._internal();

  static const String _fontFamily = 'app_icons';

  static const IconData ic_error = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData ic_error_close =
      IconData(0xe901, fontFamily: _fontFamily);
  static const IconData ic_info = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData ic_info_close =
      IconData(0xe903, fontFamily: _fontFamily);
  static const IconData ic_success = IconData(0xe904, fontFamily: _fontFamily);
  static const IconData ic_success_close =
      IconData(0xe905, fontFamily: _fontFamily);
  static const IconData ic_warning = IconData(0xe906, fontFamily: _fontFamily);
  static const IconData ic_warning_close =
      IconData(0xe907, fontFamily: _fontFamily);
  static const IconData logo = IconData(0xe908, fontFamily: _fontFamily);
  static const IconData onb_1 = IconData(0xe912, fontFamily: _fontFamily);
  static const IconData onb_2 = IconData(0xe913, fontFamily: _fontFamily);
  static const IconData onb_3 = IconData(0xe914, fontFamily: _fontFamily);
  static const IconData onb_4 = IconData(0xe935, fontFamily: _fontFamily);
  static const IconData sort_asc = IconData(0xe936, fontFamily: _fontFamily);
  static const IconData sort_desc = IconData(0xe937, fontFamily: _fontFamily);
}
