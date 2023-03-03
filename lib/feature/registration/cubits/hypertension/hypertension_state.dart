// ignore_for_file: sort_constructors_first

part of 'hypertension_cubit.dart';


@immutable
class HypertensionState {    
  /* init: false */
  final bool isValid;

/* 
init: const ValidHypertension.pure()
*/
  final ValidHypertension validHypertension;

/* init: const [false,false] */
  final List<bool> hypertensionSelected;

  // end
   
//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  
  const HypertensionState({
    this.isValid = false,
    this.validHypertension = const ValidHypertension.pure(),
    this.hypertensionSelected = const [false, false],
  });
  /*
   factory HypertensionState.init() => HypertensionState(
      ); 
  */
Map<String, dynamic> toMap() {
  return <String, dynamic>{
      'isValid': isValid, 
      'validHypertension': validHypertension.toMap(), 
      'hypertensionSelected': hypertensionSelected, 
    };
  }

    factory HypertensionState.fromMap(Map<String, dynamic> map) {
    return HypertensionState(
      isValid: map['isValid'] as bool? ?? false, 
      validHypertension: ValidHypertension.fromMap(map['validHypertension'] as Map<String, dynamic>,), 
      hypertensionSelected: (map['hypertensionSelected'] as List<dynamic>?)?.map((e) => e as bool).toList() ?? const [false, false], 
    );
  }

  HypertensionState copyWith({
    bool? isValid,
    ValidHypertension? validHypertension,
    List<bool>? hypertensionSelected,
  }) {
    return HypertensionState(
      isValid: isValid ?? this.isValid, 
      validHypertension: validHypertension ?? this.validHypertension, 
      hypertensionSelected: hypertensionSelected ?? this.hypertensionSelected, 
    );
  }

  String toJson() => json.encode(toMap());  
factory HypertensionState.fromJson(String source) => HypertensionState.fromMap(json.decode(source) as Map<String, dynamic>,);  
      
  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HypertensionState &&
            (identical(other.isValid, isValid) || other.isValid == isValid) && 
            (identical(other.validHypertension, validHypertension) || other.validHypertension == validHypertension) && 
            const DeepCollectionEquality().equals(other.hypertensionSelected, hypertensionSelected,));
  }
  
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isValid,
        validHypertension,
        const DeepCollectionEquality().hash(hypertensionSelected,),
]);
      @override
  String toString() {
    return 'HypertensionState(isValid: $isValid, validHypertension: $validHypertension, hypertensionSelected: $hypertensionSelected, )';
    }

}
