import 'package:nutrition/core/valid/valid.dart';
import 'package:nutrition/localization/gen/app_localizations.dart';

///
class ValidHeight extends FormzInput<String?, ValidHeightError> {
  factory ValidHeight.fromMap(Map<String, dynamic> map) {
    final result = map['ValidHeightFormz'].toString();
    if (result.isEmpty) return const ValidHeight.pure();

    return ValidHeight.dirty(result);
  }
  const ValidHeight.pure() : super.pure(null);
  const ValidHeight.dirty(super.value) : super.dirty();

  @override
  ValidHeightError? validator(String? value) {
    return value == null ? ValidHeightError.notSelected : null;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'ValidHeightFormz': value};
  }

  @override
  String? errorText({required AppLocalizations l}) {
    return null;
  }
}

extension ValidHeightExtension on ValidHeight {
  ValidHeightError get notSelected => ValidHeightError.notSelected;
}

enum ValidHeightError {
  notSelected,
}