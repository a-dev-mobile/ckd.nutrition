import 'package:nutrition/core/valid/valid.dart';
import 'package:nutrition/features/registration/registration.dart';
import 'package:nutrition/features/registration/registration.dart';
import 'package:nutrition/localization/gen/app_localizations.dart';

class ValidActivity extends FormzInput<EnumActivity, ValidActivityError> {
  factory ValidActivity.fromMap(Map<String, dynamic> map) {
    final result = EnumActivity.fromValue(
      map['ValidActivityFormz'] as String?,
      fallback: EnumActivity.none,
    );

    return result == EnumActivity.none
        ? const ValidActivity.pure()
        : ValidActivity.dirty(result);
  }
  const ValidActivity.pure() : super.pure(EnumActivity.none);
  const ValidActivity.dirty([super.value = EnumActivity.none]) : super.dirty();

  @override
  ValidActivityError? validator(EnumActivity value) {
    return value == EnumActivity.none ? ValidActivityError.notSelected : null;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ValidActivityFormz': value.name,
    };
  }

  @override
  String? errorText({required AppLocalizations l}) {
    return isPure
        ? null
        : error == notSelected
            ? l.activity_not_selected
            : null;
  }
}

extension ValidActivityX on ValidActivity {
  ValidActivityError get notSelected => ValidActivityError.notSelected;

  EnumActivity get activityLight => EnumActivity.light;
  EnumActivity get activityNormal => EnumActivity.normal;
  EnumActivity get activityNone => EnumActivity.none;
}

enum ValidActivityError {
  notSelected,
}
