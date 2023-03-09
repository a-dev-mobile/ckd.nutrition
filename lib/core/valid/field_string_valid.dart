// ignore_for_file: sort_constructors_first, avoid_bool_literals_in_conditional_expressions
import 'dart:convert';

import 'package:meta/meta.dart';

@immutable
class FieldStringValid {
  /* init:'' */
  final String value;
  final String? errorMessage;
  /* init: false */
  final bool isValid;
  // end

//          --TURN_GEN--
//  *************************************
//           GENERATED CODE
//  *************************************

  const FieldStringValid({
    this.value = '',
    this.isValid = false,
    this.errorMessage,
  });
  /*
   factory FieldStringValid.init() => FieldStringValid(
      ); 
  */
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'errorMessage': errorMessage,
      'isValid': isValid,
    };
  }

  factory FieldStringValid.fromMap(Map<String, dynamic> map) {
    return FieldStringValid(
      value: map['value'] != null ? map['value'] as String : '',
      errorMessage:
          map['errorMessage'] != null ? map['errorMessage'] as String : null,
      isValid: map['isValid'] != null ? map['isValid'] as bool : false,
    );
  }

  FieldStringValid copyWith({
    String? value,
    String? errorMessage,
    bool? isValid,
  }) {
    return FieldStringValid(
      value: value ?? this.value,
      errorMessage: errorMessage ?? this.errorMessage,
      isValid: isValid ?? this.isValid,
    );
  }

  String toJson() => json.encode(toMap());
  factory FieldStringValid.fromJson(String source) => FieldStringValid.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FieldStringValid &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        value,
        errorMessage,
        isValid,
      ]);
  @override
  String toString() {
    return 'FieldStringValid(value: $value, errorMessage: $errorMessage, isValid: $isValid, )';
  }
}
