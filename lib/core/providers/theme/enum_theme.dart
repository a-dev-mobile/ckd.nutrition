  // ignore_for_file: constant_identifier_names, non_constant_identifier_names, lines_longer_than_80_chars
  /*
  
  enum EnumTheme { light, dark }

  */
  
//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  

enum EnumTheme with Comparable<EnumTheme> { 
  light('light'),
  dark('dark');

  const EnumTheme(this.value);

  final String value;

  static EnumTheme fromValue(
    String? value, {
    EnumTheme? fallback,
  }) {
    switch (value) {
      case 'light':
        return light;
      case 'dark':
        return dark;

      default:
        return fallback ?? (throw ArgumentError.value(value));
    }
  }


  T map<T>({
    required T Function() light,
    required T Function() dark,

  }) {
    switch (this) {
      case EnumTheme.light:
        return light();     
      case EnumTheme.dark:
        return dark();     

    }
  }

  T mapConst<T>({
    required T light,
    required T dark,

  }) {
    switch (this) {
      case EnumTheme.light:
        return light;     
      case EnumTheme.dark:
        return dark;     

    }
  }

  T maybeMap<T>({
    required T Function() orElse,
    T Function()? light,
    T Function()? dark,

  }) =>
      map<T>(
      light: light ?? orElse,     
      dark: dark ?? orElse,     

      );

  T? maybeMapOrNull<T>({
    T Function()? light,
    T Function()? dark,

  }) =>
      maybeMap<T?>(
        orElse: () => null,
        light: light,  
        dark: dark,  
        
      );

  @override
  int compareTo(EnumTheme other) => index.compareTo(other.index);

  @override
  String toString() => value;
   }
