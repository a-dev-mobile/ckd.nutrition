import 'package:formz/formz.dart';
import 'package:nutrition/feature/registration/registration.dart';
import 'package:nutrition/localization/gen/app_localizations.dart';

class ValidDiabetes extends FormzInput<EnumDiabetes, ValidDiabetesError> {
  factory ValidDiabetes.fromMap(Map<String, dynamic> map) {
    final result = EnumDiabetes.fromValue(
      map['ValidDiabetesFormz'] as String?,
      fallback: EnumDiabetes.none,
    );

    return result == EnumDiabetes.none
        ? const ValidDiabetes.pure()
        : ValidDiabetes.dirty(result);
  }
  const ValidDiabetes.pure() : super.pure(EnumDiabetes.none);
  const ValidDiabetes.dirty([super.value = EnumDiabetes.none]) : super.dirty();

  @override
  ValidDiabetesError? validator(EnumDiabetes value) {
    return value == EnumDiabetes.none ? ValidDiabetesError.notSelected : null;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'ValidDiabetesFormz': value.name};
  }

  String? errorText({required AppLocalizations l}) {
    return null;
  }
}

extension ValidDiabetesX on ValidDiabetes {
  ValidDiabetesError get notSelected => ValidDiabetesError.notSelected;
}

enum ValidDiabetesError {
  notSelected,
}
