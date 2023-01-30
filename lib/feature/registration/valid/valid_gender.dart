import 'package:formz/formz.dart';
import 'package:nutrition/feature/registration/registration.dart';
import 'package:nutrition/localization/gen/app_localizations.dart';

class ValidGender extends FormzInput<EnumGender, ValidGenderError> {
  factory ValidGender.fromMap(Map<String, dynamic> map) {
    final result = EnumGender.fromValue(
      map['ValidGenderFormz'] as String?,
      fallback: EnumGender.none,
    );

    return result == EnumGender.none
        ? const ValidGender.pure()
        : ValidGender.dirty(result);
  }
  const ValidGender.pure() : super.pure(EnumGender.none);
  const ValidGender.dirty([super.value = EnumGender.none]) : super.dirty();

  @override
  ValidGenderError? validator(EnumGender value) {
    return value == EnumGender.none ? ValidGenderError.notSelected : null;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ValidGenderFormz': value.name,
    };
  }

  String? errorText({required AppLocalizations l}) {
    return isPure
        ? null
        : error == notSelected
            ? l.gender_not_selected
            : null;
  }
}

extension ValidGenderX on ValidGender {
  ValidGenderError get notSelected => ValidGenderError.notSelected;
  EnumGender get genderMale => EnumGender.male;
  EnumGender get genderFemale => EnumGender.female;
  EnumGender get genderNone => EnumGender.none;
}

enum ValidGenderError {
  notSelected,
}
