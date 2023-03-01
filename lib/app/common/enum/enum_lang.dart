  // ignore_for_file: constant_identifier_names, non_constant_identifier_names, lines_longer_than_80_chars
  /*
  
  
  enum EnumLang {
  en('en_US'),
  ru('ru_RU'),
    
}
  */
  
//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  

enum EnumLang with Comparable<EnumLang> { 
  en('en_US'),
  ru('ru_RU');

  const EnumLang(this.value);

  final String value;

  static EnumLang fromValue(
    String? value, {
    EnumLang? fallback,
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

  T map<T>({
    required T Function() en,
    required T Function() ru,

  }) {
    switch (this) {
      case EnumLang.en:
        return en();     
      case EnumLang.ru:
        return ru();     

    }
  }
  
  T maybeMap<T>({
    required T Function() orElse,
    T Function()? en,
    T Function()? ru,

  }) =>
      map<T>(
      en: en ?? orElse,     
      ru: ru ?? orElse,     

      );

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
  int compareTo(EnumLang other) => index.compareTo(other.index);

  @override
  String toString() => value;
   }
