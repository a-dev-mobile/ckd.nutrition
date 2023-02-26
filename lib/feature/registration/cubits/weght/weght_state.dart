// ignore_for_file: sort_constructors_first

part of 'weght_cubit.dart';

/*  */
@immutable
class WeghtState { 
 
/* init: false */
  final bool isValid;

/* 
type: data
init: const ValidWeight.pure()
*/
  final ValidWeight validWeight;

  // end
   
//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  
  const WeghtState({
    this.isValid = false,
    this.validWeight = const ValidWeight.pure(),
  });
  /*
   factory WeghtState.init() => WeghtState(
      ); 
  */
Map<String, dynamic> toMap() {
  return <String, dynamic>{
      'isValid': isValid, 
      'validWeight': validWeight.toMap(), 
    };
  }

    factory WeghtState.fromMap(Map<String, dynamic> map) {
    return WeghtState(
      isValid: map['isValid'] as bool? ?? false, 
      validWeight: ValidWeight.fromMap(map['validWeight'] as Map<String, dynamic>,), 
    );
  }

  WeghtState copyWith({
    bool? isValid,
    ValidWeight? validWeight,
  }) {
    return WeghtState(
      isValid: isValid ?? this.isValid, 
      validWeight: validWeight ?? this.validWeight, 
    );
  }

  String toJson() => json.encode(toMap());  
factory WeghtState.fromJson(String source) => WeghtState.fromMap(json.decode(source) as Map<String, dynamic>,);  
      
  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeghtState &&
            (identical(other.isValid, isValid) || other.isValid == isValid) && 
            (identical(other.validWeight, validWeight) || other.validWeight == validWeight));
  }
  
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isValid,
        validWeight,
]);
      @override
  String toString() {
    return 'WeghtState(isValid: $isValid, validWeight: $validWeight, )';
    }

}
