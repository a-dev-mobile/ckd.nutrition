// ignore_for_file: sort_constructors_first, avoid_bool_literals_in_conditional_expressions

part of 'registration_name_provider.dart';

/*  */
@immutable
class RegistrationNameState {
/* init: false */
  final bool isValid;
/* 
init: const FieldStringValid()
*/
  final FieldStringValid nameValid;

  // end

//          --TURN_GEN--
//             v0.4.1
//  *************************************
//           GENERATED CODE
//  *************************************

  const RegistrationNameState({
    this.isValid = false,
    this.nameValid = const FieldStringValid(),
  });
  /*
   factory RegistrationNameState.init() => RegistrationNameState(
      ); 
  */
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isValid': isValid,
      'nameValid': nameValid.toMap(),
    };
  }

  factory RegistrationNameState.fromMap(Map<String, dynamic>? map) {
    if (map == null) return const RegistrationNameState();

    return RegistrationNameState(
      isValid: map['isValid'] != null ? map['isValid'] as bool : false,
      nameValid: map['nameValid'] != null
          ? FieldStringValid.fromMap(map['nameValid'] as Map<String, dynamic>)
          : const FieldStringValid(),
    );
  }

  RegistrationNameState copyWith({
    bool? isValid,
    FieldStringValid? nameValid,
  }) {
    return RegistrationNameState(
      isValid: isValid ?? this.isValid,
      nameValid: nameValid ?? this.nameValid,
    );
  }

  String toJson() => json.encode(toMap());
  factory RegistrationNameState.fromJson(String source) =>
      RegistrationNameState.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegistrationNameState &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.nameValid, nameValid) ||
                other.nameValid == nameValid));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isValid,
        nameValid,
      ]);
  @override
  String toString() {
    return 'RegistrationNameState(isValid: $isValid, nameValid: $nameValid, )';
  }
}
