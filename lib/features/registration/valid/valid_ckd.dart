import 'package:nutrition/core/valid/valid.dart';
import 'package:nutrition/features/registration/registration.dart';
import 'package:nutrition/localization/gen/app_localizations.dart';

class ValidCkd extends FormzInput<EnumCkd, ValidCkdError> {
  factory ValidCkd.fromMap(Map<String, dynamic> map) {
    final result = EnumCkd.fromValue(
      map['ValidCkdFormz'] as String?,
      fallback: EnumCkd.none,
    );

    return result == EnumCkd.none
        ? const ValidCkd.pure()
        : ValidCkd.dirty(result);
  }
  const ValidCkd.pure() : super.pure(EnumCkd.none);
  const ValidCkd.dirty([super.value = EnumCkd.none]) : super.dirty();

  @override
  ValidCkdError? validator(EnumCkd value) {
    return value == EnumCkd.none ? ValidCkdError.notSelected : null;
  }

  @override
  String? errorText({required AppLocalizations l}) => isPure
      ? null
      : error == notSelected
          ? l.no_stage_skd_selected
          : null;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'ValidCkdFormz': value.name};
  }
}

extension ValidCkdX on ValidCkd {
  ValidCkdError get notSelected => ValidCkdError.notSelected;
}

enum ValidCkdError {
  notSelected,
}
