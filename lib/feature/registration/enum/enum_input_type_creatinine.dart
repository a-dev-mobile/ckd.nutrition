// ignore_for_file: constant_identifier_names, non_constant_identifier_names, lines_longer_than_80_chars
/*
  enum EnumInputTypeCreatinine { mgDl, mmmolL, mcmolL }

  */

//          --TURN_GEN--
//  *************************************
//           GENERATED CODE
//  *************************************

enum EnumInputTypeCreatinine with Comparable<EnumInputTypeCreatinine> {
  mgDl('mgDl'),
  mmmolL('mmmolL'),
  mcmolL('mcmolL');

  const EnumInputTypeCreatinine(this.value);

  final String value;

  static EnumInputTypeCreatinine fromValue(
    String? value, {
    EnumInputTypeCreatinine? fallback,
  }) {
    switch (value) {
      case 'mgDl':
        return mgDl;
      case 'mmmolL':
        return mmmolL;
      case 'mcmolL':
        return mcmolL;

      default:
        return fallback ?? (throw ArgumentError.value(value));
    }
  }

  /// Pattern matching
  T map<T>({
    required T Function() mgDl,
    required T Function() mmmolL,
    required T Function() mcmolL,
  }) {
    switch (this) {
      case EnumInputTypeCreatinine.mgDl:
        return mgDl();
      case EnumInputTypeCreatinine.mmmolL:
        return mmmolL();
      case EnumInputTypeCreatinine.mcmolL:
        return mcmolL();
    }
  }

  /// Pattern matching
  T maybeMap<T>({
    required T Function() orElse,
    T Function()? mgDl,
    T Function()? mmmolL,
    T Function()? mcmolL,
  }) =>
      map<T>(
        mgDl: mgDl ?? orElse,
        mmmolL: mmmolL ?? orElse,
        mcmolL: mcmolL ?? orElse,
      );

  /// Pattern matching
  T? maybeMapOrNull<T>({
    T Function()? mgDl,
    T Function()? mmmolL,
    T Function()? mcmolL,
  }) =>
      maybeMap<T?>(
        orElse: () => null,
        mgDl: mgDl,
        mmmolL: mmmolL,
        mcmolL: mcmolL,
      );

  @override
  int compareTo(EnumInputTypeCreatinine other) => index.compareTo(other.index);

  @override
  String toString() => value;
}
