enum LocaleEnum with Comparable<LocaleEnum> {
  ru('ru_RU'),
  en('en_EN');

  const LocaleEnum(this.value);
  final String value;

// end

//          --TURN_GEN--
//             v0.4.1
//  *************************************
//           GENERATED CODE
//  *************************************

  /// Creates a new instance of [LocaleEnum] from a given String value.
  ///
  /// If the given value matches one of the values defined in the [LocaleEnum] enumeration,
  /// a corresponding instance of [LocaleEnum] is returned.
  /// If the given value is null or does not match any of the enumeration values and a fallback
  /// value is not provided, an [ArgumentError] is thrown.
  ///
  /// The `fallback` parameter is an optional [LocaleEnum] value that will be returned if the
  /// given value does not match any of the enumeration values.
  ///
  /// Example usage:
  /// ```dart
  /// LocaleEnum locale = LocaleEnum.fromValue('en', fallback: LocaleEnum.ru);
  /// print(locale); // Output: LocaleEnum.en(en)
  /// ```
  static LocaleEnum fromValue(String? value, {LocaleEnum? fallback}) {
    switch (value) {
      case 'ru_RU':
        return ru;
      case 'en_EN':
        return en;
      default:
        return fallback ??
            (throw ArgumentError.value(
              value,
              '',
              'Value not found in LocaleEnum',
            ));
    }
  }

  /// Calls the appropriate function based on the value of this [LocaleEnum] instance.
  ///
  /// This method returns the result of calling the appropriate function for the value of the current [LocaleEnum] instance.
  ///
  /// Example usage:
  /// ```dart
  /// LocaleEnum ru = LocaleEnum.ru;
  /// String result = ru.map(
  ///   ru: () => 'Привет!',
  ///   en: () => 'Hello!',
  /// );
  /// print(result); // Output: 'Привет!'
  /// ```
  T map<T>({
    required T Function() ru,
    required T Function() en,
  }) {
    switch (this) {
      case LocaleEnum.ru:
        return ru();
      case LocaleEnum.en:
        return en();
    }
  }

  /// Calls the appropriate function based on the value of this [LocaleEnum] instance.
  ///
  /// This method returns the appropriate value for the value of the current [LocaleEnum] instance.
  ///
  /// Example usage:
  /// ```dart
  /// LocaleEnum en = LocaleEnum.en;
  /// String result = en.mapValue(
  ///   ru: 'Привет!',
  ///   en: 'Hello!',
  /// );
  /// print(result); // Output: 'Hello!'
  /// ```
  T mapValue<T>({
    required T ru,
    required T en,
  }) {
    switch (this) {
      case LocaleEnum.ru:
        return ru;
      case LocaleEnum.en:
        return en;
    }
  }

  /// Calls the appropriate function based on the value of this [LocaleEnum] instance.
  ///
  /// If the corresponding function for the value of this [LocaleEnum] instance is not provided,
  /// the `orElse` function will be called instead.
  /// This method returns the value returned by the appropriate function for the value of this [LocaleEnum] instance.
  ///
  /// Example usage:
  /// ```dart
  /// LocaleEnum ru = LocaleEnum.ru;
  /// String result = ru.maybeMap<String>(
  ///   orElse: () => 'Unknown',
  ///   ru: () => 'Привет!',
  /// );
  /// print(result); // Output: 'Привет!'
  /// ```
  T maybeMap<T>({
    required T Function() orElse,
    T Function()? ru,
    T Function()? en,
  }) =>
      map<T>(
        ru: ru ?? orElse,
        en: en ?? orElse,
      );

  /// Maps the value of this [LocaleEnum] to a new value of type [T], using the given
  /// values to replace each possible value of the enumeration.
  ///
  /// The value that corresponds to the value of this [LocaleEnum] is returned from this method.
  ///
  /// If no corresponding value is provided for the value of this [LocaleEnum], the
  /// `orElse` parameter is returned from this method.
  ///
  /// Example usage:
  /// ```dart
  /// LocaleEnum locale = LocaleEnum.en;
  /// String message = locale.maybeMapValue<String>(
  ///   orElse: 'Unknown locale',
  ///   ru: 'Привет!',
  ///   en: 'Hello!',
  /// );
  /// print(message); // Output: 'Hello!'
  /// ```
  T maybeMapValue<T>({
    required T orElse,
    T? ru,
    T? en,
  }) =>
      mapValue<T>(
        ru: ru ?? orElse,
        en: en ?? orElse,
      );

  /// Maps the value of this [LocaleEnum] to a new value of type [T], using the given
  /// functions to replace each possible value of the enumeration.
  ///
  /// The function that corresponds to the value of this
  /// [LocaleEnum] is called and its result is returned from this method.
  ///
  /// If no corresponding function is provided for the value of this [LocaleEnum], `null`
  /// is returned from this method.
  ///
  /// Example usage:
  /// ```dart
  /// LocaleEnum locale = LocaleEnum.en;
  /// String? message = locale.maybeMapOrNull<String>(
  ///   en: () => 'Hello!',
  /// );
  /// print(message); // Output: 'Hello!'
  /// ```
  T? maybeMapOrNull<T>({
    T Function()? ru,
    T Function()? en,
  }) =>
      maybeMap<T?>(
        orElse: () => null,
        ru: ru,
        en: en,
      );

  /// Maps the value of this [LocaleEnum] to a new value of type [T], using the given
  /// values to replace each possible value of the enumeration.
  ///
  /// The value that corresponds to the value of this [LocaleEnum] is returned from this method.
  ///
  /// If no corresponding value is provided for the value of this [LocaleEnum], `null`
  /// is returned from this method.
  ///
  /// Example usage:
  /// ```dart
  /// LocaleEnum locale = LocaleEnum.en;
  /// String? message = locale.maybeMapOrNullValue<String>(
  ///   en: 'Hello!',
  /// );
  /// print(message); // Output: 'Hello!'
  /// ```
  T? maybeMapOrNullValue<T>({
    T? ru,
    T? en,
  }) =>
      maybeMapValue<T?>(
        orElse: null,
        ru: ru,
        en: en,
      );

  /// Returns a list of all possible values of this enumeration.
  ///
  /// The values are returned as a list of strings, representing the value of each
  /// enumeration value in the same order as they were declared in the enumeration.
  ///
  /// Example usage:
  /// ```dart
  /// List<String> values = LocaleEnum.getValues();
  /// print(values); // Output: ['ru', 'en']
  /// ```
  static List<String> getValues() =>
      LocaleEnum.values.map((e) => e.value).toList();

  @override
  int compareTo(LocaleEnum other) => index.compareTo(other.index);

  @override
  String toString() => 'LocaleEnum.$name($value)';
}
