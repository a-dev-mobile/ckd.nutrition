// // ignore_for_file: sort_constructors_first
// // ignore_for_file: public_member_api_docs,  lines_longer_than_80_chars

// part of 'setting_cubit.dart';

// @immutable
// class SettingState {
//   /* init: const[] */
//   final List<bool> boolsLocale;
//   /* init: const[] */
//   final List<bool> boolsTheme;
//   /* type:enum */
//   final LocaleEnum localeActive;
//   /* type:enum */
//   final ThemeMode themeActive;

//   // end

// //          --TURN_GEN--
// //  *************************************
// //           GENERATED CODE
// //  *************************************

//   const SettingState({
//     required this.localeActive,
//     required this.themeActive,
//     this.boolsLocale = const [],
//     this.boolsTheme = const [],
//   });
//   /*
//    factory SettingState.init() => SettingState(
//       );
//   */
//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'localeActive': localeActive.index,
//       'themeActive': themeActive.index,
//       'boolsLocale': boolsLocale,
//       'boolsTheme': boolsTheme,
//     };
//   }

//   factory SettingState.fromMap(Map<String, dynamic> map) {
//     return SettingState(
//       localeActive: LocaleEnum.values[map['localeActive'] as int],
//       themeActive: ThemeMode.values[map['themeActive'] as int],
//       boolsLocale: (map['boolsLocale'] as List<dynamic>?)
//               ?.map((e) => e as bool)
//               .toList() ??
//           const [],
//       boolsTheme: (map['boolsTheme'] as List<dynamic>?)
//               ?.map((e) => e as bool)
//               .toList() ??
//           const [],
//     );
//   }

//   SettingState copyWith({
//     LocaleEnum? localeActive,
//     ThemeMode? themeActive,
//     List<bool>? boolsLocale,
//     List<bool>? boolsTheme,
//   }) {
//     return SettingState(
//       localeActive: localeActive ?? this.localeActive,
//       themeActive: themeActive ?? this.themeActive,
//       boolsLocale: boolsLocale ?? this.boolsLocale,
//       boolsTheme: boolsTheme ?? this.boolsTheme,
//     );
//   }

//   String toJson() => json.encode(toMap());
//   factory SettingState.fromJson(String source) => SettingState.fromMap(
//         json.decode(source) as Map<String, dynamic>,
//       );

//   @override
//   bool operator ==(dynamic other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is SettingState &&
//             (identical(other.localeActive, localeActive) ||
//                 other.localeActive == localeActive) &&
//             (identical(other.themeActive, themeActive) ||
//                 other.themeActive == themeActive) &&
//             const DeepCollectionEquality().equals(
//               other.boolsLocale,
//               boolsLocale,
//             ) &&
//             const DeepCollectionEquality().equals(
//               other.boolsTheme,
//               boolsTheme,
//             ));
//   }

//   @override
//   int get hashCode => Object.hashAll([
//         runtimeType,
//         localeActive,
//         themeActive,
//         const DeepCollectionEquality().hash(
//           boolsLocale,
//         ),
//         const DeepCollectionEquality().hash(
//           boolsTheme,
//         ),
//       ]);
//   @override
//   String toString() {
//     return 'SettingState(localeActive: $localeActive, themeActive: $themeActive, boolsLocale: $boolsLocale, boolsTheme: $boolsTheme, )';
//   }
// }
