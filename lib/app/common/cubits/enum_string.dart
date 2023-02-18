// ignore_for_file: constant_identifier_names, non_constant_identifier_names, lines_longer_than_80_chars
/*
  
  enum Locale {
  en('en_US'),
  ru('ru_RU'),
    
}
  */

//          --TURN_GEN--
//  *************************************
//           GENERATED CODE
//  *************************************

enum Locale with Comparable<Locale> {
  en('en_US'),
  ru('ru_RU');

  const Locale(this.value);

  final String value;

  static Locale fromValue(
    String? value, {
    Locale? fallback,
  }) {
    switch (value) {
      case 'en_US':
        return en;
      case 'ru_RU':
        return ru;

      default:
        return fallback ?? (throw ArgumentError.value(value));
    }
  }

  /// Pattern matching
  T map<T>({
    required T Function() en,
    required T Function() ru,
  }) {
    switch (this) {
      case Locale.en:
        return en();
      case Locale.ru:
        return ru();
    }
  }

  /// Pattern matching
  T maybeMap<T>({
    required T Function() orElse,
    T Function()? en,
    T Function()? ru,
  }) =>
      map<T>(
        en: en ?? orElse,
        ru: ru ?? orElse,
      );

  /// Pattern matching
  T? maybeMapOrNull<T>({
    T Function()? en,
    T Function()? ru,
  }) =>
      maybeMap<T?>(
        orElse: () => null,
        en: en,
        ru: ru,
      );

  @override
  int compareTo(Locale other) => index.compareTo(other.index);

  @override
  String toString() => value;
}
