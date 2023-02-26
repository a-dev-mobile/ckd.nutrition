// ignore_for_file: sort_constructors_first

part of 'gender_cubit.dart';

/*  */
@immutable
class GenderState {
/* 
type: data
init: const ValidGender.pure()
*/
  final ValidGender validGender;
/* */
  final List<bool> genderSelected;
/* init: false */
  final bool isValid;
  // end

//          --TURN_GEN--
//  *************************************
//           GENERATED CODE
//  *************************************

  const GenderState({
    required this.genderSelected,
    this.validGender = const ValidGender.pure(),
    this.isValid = false,
  });
  /*
   factory GenderState.init() => GenderState(
        genderSelected: const [],
      ); 
  */
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'validGender': validGender.toMap(),
      'genderSelected': genderSelected,
      'isValid': isValid,
    };
  }

  factory GenderState.fromMap(Map<String, dynamic> map) {
    return GenderState(
      validGender: ValidGender.fromMap(
        map['validGender'] as Map<String, dynamic>,
      ),
      genderSelected: (map['genderSelected'] as List<dynamic>)
          .map((e) => e as bool)
          .toList(),
      isValid: map['isValid'] as bool? ?? false,
    );
  }

  GenderState copyWith({
    ValidGender? validGender,
    List<bool>? genderSelected,
    bool? isValid,
  }) {
    return GenderState(
      validGender: validGender ?? this.validGender,
      genderSelected: genderSelected ?? this.genderSelected,
      isValid: isValid ?? this.isValid,
    );
  }

  String toJson() => json.encode(toMap());
  factory GenderState.fromJson(String source) => GenderState.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenderState &&
            (identical(other.validGender, validGender) ||
                other.validGender == validGender) &&
            const DeepCollectionEquality().equals(
              other.genderSelected,
              genderSelected,
            ) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        validGender,
        const DeepCollectionEquality().hash(
          genderSelected,
        ),
        isValid,
      ]);
  @override
  String toString() {
    return 'GenderState(validGender: $validGender, genderSelected: $genderSelected, isValid: $isValid, )';
  }
}
