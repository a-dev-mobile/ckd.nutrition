// ignore_for_file: sort_constructors_first

part of 'diabetes_cubit.dart';

/*  */
@immutable
class DiabetesState { 
  /* init: false */
  final bool isValid;

/* init: const [false, false] */
  final List<bool> diabetesSelected;

/* 
type: data
init: const ValidDiabetes.pure()
*/
  final ValidDiabetes validDiabetes;

  // end
   
//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  
  const DiabetesState({
    this.isValid = false,
    this.diabetesSelected = const [false, false],
    this.validDiabetes = const ValidDiabetes.pure(),
  });
  /*
   factory DiabetesState.init() => DiabetesState(
      ); 
  */
Map<String, dynamic> toMap() {
  return <String, dynamic>{
      'isValid': isValid, 
      'diabetesSelected': diabetesSelected, 
      'validDiabetes': validDiabetes.toMap(), 
    };
  }

    factory DiabetesState.fromMap(Map<String, dynamic> map) {
    return DiabetesState(
      isValid: map['isValid'] as bool? ?? false, 
      diabetesSelected: (map['diabetesSelected'] as List<dynamic>?)?.map((e) => e as bool).toList() ?? const [false, false], 
      validDiabetes: ValidDiabetes.fromMap(map['validDiabetes'] as Map<String, dynamic>,), 
    );
  }

  DiabetesState copyWith({
    bool? isValid,
    List<bool>? diabetesSelected,
    ValidDiabetes? validDiabetes,
  }) {
    return DiabetesState(
      isValid: isValid ?? this.isValid, 
      diabetesSelected: diabetesSelected ?? this.diabetesSelected, 
      validDiabetes: validDiabetes ?? this.validDiabetes, 
    );
  }

  String toJson() => json.encode(toMap());  
factory DiabetesState.fromJson(String source) => DiabetesState.fromMap(json.decode(source) as Map<String, dynamic>,);  
      
  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DiabetesState &&
            (identical(other.isValid, isValid) || other.isValid == isValid) && 
            const DeepCollectionEquality().equals(other.diabetesSelected, diabetesSelected,) && 
            (identical(other.validDiabetes, validDiabetes) || other.validDiabetes == validDiabetes));
  }
  
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isValid,
        const DeepCollectionEquality().hash(diabetesSelected,),
        validDiabetes,
]);
      @override
  String toString() {
    return 'DiabetesState(isValid: $isValid, diabetesSelected: $diabetesSelected, validDiabetes: $validDiabetes, )';
    }

}
