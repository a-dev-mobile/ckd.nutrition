import 'package:formz/formz.dart';
import 'package:nutrition/feature/registration/registration.dart';
import 'package:nutrition/localization/gen/app_localizations.dart';

class ValidDailyDiuresis
    extends FormzInput<EnumDailyDiuresis, DailyDiuresisError> {
  factory ValidDailyDiuresis.fromMap(Map<String, dynamic> map) {
    final result = EnumDailyDiuresis.fromValue(
      map['ValidDailyDiuresis'] as String?,
      fallback: EnumDailyDiuresis.none,
    );

    return result == EnumDailyDiuresis.none
        ? const ValidDailyDiuresis.pure()
        : ValidDailyDiuresis.dirty(result);
  }
  const ValidDailyDiuresis.pure() : super.pure(EnumDailyDiuresis.none);
  const ValidDailyDiuresis.dirty([super.value = EnumDailyDiuresis.none])
      : super.dirty();

  @override
  DailyDiuresisError? validator(EnumDailyDiuresis value) {
    return value == EnumDailyDiuresis.none
        ? DailyDiuresisError.notSelected
        : null;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'ValidDailyDiuresis': value.name};
  }

  String? errorText({required AppLocalizations l}) {
    return null;
  }
}

extension DailyDiuresisX on ValidDailyDiuresis {
  DailyDiuresisError get notSelected => DailyDiuresisError.notSelected;
}

enum DailyDiuresisError {
  notSelected,
}
