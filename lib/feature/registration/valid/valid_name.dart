// ignore_for_file: avoid-nested-conditional-expressions

import 'package:nutrition/core/valid/valid.dart';
import 'package:nutrition/localization/gen/app_localizations.dart';

class ValidName extends FormzInput<String, ValidNameError> {
  factory ValidName.fromMap(Map<String, dynamic> map) {
    final result = (map['ValidNameFormz'] as String?) ?? '';
    if (result.isEmpty) return const ValidName.pure();

    return ValidName.dirty(result);
  }
  const ValidName.pure() : super.pure('');
  const ValidName.dirty([super.value = '']) : super.dirty();

  @override
  ValidNameError? validator(String value) {
    return value.isEmpty
        ? ValidNameError.isEmpty
        : RegExp(r'^.{30,100}$').hasMatch(value)
            ? ValidNameError.maxLenght
            : null;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ValidNameFormz': value,
    };
  }

  @override
  String? errorText({required AppLocalizations l}) {
    return isPure
        ? null
        : error == maxLength
            ? l.max_text_length
            : error == isEmpty
                ? l.enter_name
                : null;
  }
}

extension ValidNameExtension on ValidName {
  ValidNameError get isEmpty => ValidNameError.isEmpty;
  ValidNameError get maxLength => ValidNameError.maxLenght;
}

enum ValidNameError { isEmpty, maxLenght }
