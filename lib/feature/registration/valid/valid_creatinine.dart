// ignore_for_file: sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:nutrition/core/valid/valid.dart';
import 'package:nutrition/localization/gen/app_localizations.dart';

///
class ValidCreatinine extends FormzInput<double?, ValidCreatinineError>
    with EquatableMixin {
  const ValidCreatinine.pure({this.externalError, double? value})
      : super.pure(value);

  const ValidCreatinine.dirty({this.externalError, double? value})
      : super.dirty(value);

  final ValidCreatinineError? externalError;

  factory ValidCreatinine.fromMap(Map<String, dynamic> map) {
    final result = map['ValidCreatinine'] as double?;
    if (result == null) return const ValidCreatinine.pure();

    return ValidCreatinine.pure(value: result);
  }
  @override
  ValidCreatinineError? validator(double? value) {
    // print('--validator ${externalError}');
    if (externalError != null) {
      return externalError;
    }

    if (value == null) return ValidCreatinineError.isEmpty;
    if (value > 3000) return ValidCreatinineError.isMax;
    if (value < 0) return ValidCreatinineError.isMin;

    return null;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'ValidCreatinine': value};
  }

  @override
  String? errorText({required AppLocalizations l}) {
    // print('--error ${externalError}');

    return isPure
        ? null
        : error == isEmpty
            ? 'Креатинин не указан'
            : error == isMax
                ? 'Указанный креатинин не поддерживается приложением'
                : error == isMin
                    ? 'Указанный креатинин не поддерживается приложением'
                    : error == isNoValid
                        ? 'Неправильное значение'
                        : error == noBirthday
                            ? 'Укажите дату своего рождения'
                            : error == noGender
                                ? 'Укажите ваш пол'
                                : null;
  }

  @override
  List<Object?> get props {
    return [externalError, value];
  }
}

extension ValidCreatinineExtension on ValidCreatinine {
  ValidCreatinineError get isEmpty => ValidCreatinineError.isEmpty;
  ValidCreatinineError get isMax => ValidCreatinineError.isMax;
  ValidCreatinineError get isMin => ValidCreatinineError.isMin;
  ValidCreatinineError get isNoValid => ValidCreatinineError.isNoValid;
  ValidCreatinineError get noGender => ValidCreatinineError.noGender;
  ValidCreatinineError get noBirthday => ValidCreatinineError.noBirthday;
}

enum ValidCreatinineError {
  isEmpty,
  isMax,
  isMin,
  isNoValid,
  noBirthday,
  noGender,
}
