// ignore_for_file: avoid-non-null-assertion

enum DaDataEnum with Comparable<DaDataEnum> {
  name('name'),
  surname('surname'),
  patronymic('patronymic'),
  all('all');

  const DaDataEnum(this.value);
  final String value;

// end

//          --TURN_GEN--
//             v0.4.1
//  *************************************
//           GENERATED CODE
//  *************************************

  /// Creates a new instance of [DaDataEnum] from a given String value.
  ///
  /// If the given value matches one of the values defined in the [DaDataEnum] enumeration,
  /// a corresponding instance of [DaDataEnum] is returned.
  /// If the given value is null or does not match any of the enumeration values and a fallback
  /// value is not provided, an [ArgumentError] is thrown.
  ///
  /// The `fallback` parameter is an optional [DaDataEnum] value that will be returned if the
  /// given value does not match any of the enumeration values.
  ///
  /// Example usage:
  /// ```dart
  /// LocaleEnum locale = LocaleEnum.fromValue('en', fallback: LocaleEnum.ru);
  /// print(locale); // Output: LocaleEnum.en(en)
  /// ```
  static DaDataEnum fromValue(String? value, {DaDataEnum? fallback}) {
    switch (value) {
      case 'name':
        return name;
      case 'surname':
        return surname;
      case 'patronymic':
        return patronymic;
      case 'all':
        return all;
      default:
        return fallback ??
            (throw ArgumentError.value(
              value,
              '',
              'Value not found in DaDataEnum',
            ));
    }
  }

  /// Calls the appropriate function based on the value of this [DaDataEnum] instance.
  ///
  /// This method returns the result of calling the appropriate function for the value of the current [DaDataEnum] instance.
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
    required T Function() name,
    required T Function() surname,
    required T Function() patronymic,
    required T Function() all,
  }) {
    switch (this) {
      case DaDataEnum.name:
        return name();
      case DaDataEnum.surname:
        return surname();
      case DaDataEnum.patronymic:
        return patronymic();
      case DaDataEnum.all:
        return all();
    }
  }

  /// Calls the appropriate function based on the value of this [DaDataEnum] instance.
  ///
  /// This method returns the appropriate value for the value of the current [DaDataEnum] instance.
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
    required T name,
    required T surname,
    required T patronymic,
    required T all,
  }) {
    switch (this) {
      case DaDataEnum.name:
        return name;
      case DaDataEnum.surname:
        return surname;
      case DaDataEnum.patronymic:
        return patronymic;
      case DaDataEnum.all:
        return all;
    }
  }

  /// Calls the appropriate function based on the value of this [DaDataEnum] instance.
  ///
  /// If the corresponding function for the value of this [DaDataEnum] instance is not provided,
  /// the `orElse` function will be called instead.
  /// This method returns the value returned by the appropriate function for the value of this [DaDataEnum] instance.
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
    T Function()? name,
    T Function()? surname,
    T Function()? patronymic,
    T Function()? all,
  }) =>
      map<T>(
        name: name ?? orElse,
        surname: surname ?? orElse,
        patronymic: patronymic ?? orElse,
        all: all ?? orElse,
      );

  /// Maps the value of this [DaDataEnum] to a new value of type [T], using the given
  /// values to replace each possible value of the enumeration.
  ///
  /// The value that corresponds to the value of this [DaDataEnum] is returned from this method.
  ///
  /// If no corresponding value is provided for the value of this [DaDataEnum], the
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
    T? name,
    T? surname,
    T? patronymic,
    T? all,
  }) =>
      mapValue<T>(
        name: name ?? orElse,
        surname: surname ?? orElse,
        patronymic: patronymic ?? orElse,
        all: all ?? orElse,
      );

  /// Maps the value of this [DaDataEnum] to a new value of type [T], using the given
  /// functions to replace each possible value of the enumeration.
  ///
  /// The function that corresponds to the value of this
  /// [DaDataEnum] is called and its result is returned from this method.
  ///
  /// If no corresponding function is provided for the value of this [DaDataEnum], `null`
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
    T Function()? name,
    T Function()? surname,
    T Function()? patronymic,
    T Function()? all,
  }) =>
      maybeMap<T?>(
        orElse: () => null,
        name: name,
        surname: surname,
        patronymic: patronymic,
        all: all,
      );

  /// Maps the value of this [DaDataEnum] to a new value of type [T], using the given
  /// values to replace each possible value of the enumeration.
  ///
  /// The value that corresponds to the value of this [DaDataEnum] is returned from this method.
  ///
  /// If no corresponding value is provided for the value of this [DaDataEnum], `null`
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
    T? name,
    T? surname,
    T? patronymic,
    T? all,
  }) =>
      maybeMapValue<T?>(
        orElse: null,
        name: name,
        surname: surname,
        patronymic: patronymic,
        all: all,
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
      DaDataEnum.values.map((e) => e.value).toList();

  @override
  int compareTo(DaDataEnum other) => index.compareTo(other.index);

  @override
  String toString() => 'DaDataEnum.$name($value)';
}
