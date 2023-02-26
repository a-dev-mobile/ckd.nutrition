// ignore_for_file: sort_constructors_first

part of 'ckd_cubit.dart';

/*  */
@immutable
class CkdState {        
  /* 
type: enum
init:  EnumCkd.none
*/
  final EnumCkd ckdCalculated;
/* init: false */
  final bool isValid;
/* 
type: data
init: const ValidCreatinine.pure()
*/
  final ValidCreatinine validCreatinine;

/* 
type: data
init: const ValidCkd.pure()
*/
  final ValidCkd validCkd;
  /*   */
  final List<bool> ckdSelected;

/* 
type: enum
init:  EnumInputTypeCreatinine.mcmolL
*/
  final EnumInputTypeCreatinine inputTypeCreatinine;
/* init: false */
  final bool isVisibleCreatinine;

  // end
   
//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  
  const CkdState({
    required this.ckdSelected,
    this.ckdCalculated = EnumCkd.none,
    this.isValid = false,
    this.validCreatinine = const ValidCreatinine.pure(),
    this.validCkd = const ValidCkd.pure(),
    this.inputTypeCreatinine = EnumInputTypeCreatinine.mcmolL,
    this.isVisibleCreatinine = false,
  });
  /*
   factory CkdState.init() => CkdState(
        ckdSelected: const [],
      ); 
  */
Map<String, dynamic> toMap() {
  return <String, dynamic>{
      'ckdCalculated': ckdCalculated.index, 
      'isValid': isValid, 
      'validCreatinine': validCreatinine.toMap(), 
      'validCkd': validCkd.toMap(), 
      'ckdSelected': ckdSelected, 
      'inputTypeCreatinine': inputTypeCreatinine.index, 
      'isVisibleCreatinine': isVisibleCreatinine, 
    };
  }

    factory CkdState.fromMap(Map<String, dynamic> map) {
    return CkdState(
      ckdCalculated: EnumCkd.values[map['ckdCalculated'] as int], 
      isValid: map['isValid'] as bool? ?? false, 
      validCreatinine: ValidCreatinine.fromMap(map['validCreatinine'] as Map<String, dynamic>,), 
      validCkd: ValidCkd.fromMap(map['validCkd'] as Map<String, dynamic>,), 
      ckdSelected: (map['ckdSelected'] as List<dynamic>).map((e) => e as bool).toList(), 
      inputTypeCreatinine: EnumInputTypeCreatinine.values[map['inputTypeCreatinine'] as int], 
      isVisibleCreatinine: map['isVisibleCreatinine'] as bool? ?? false, 
    );
  }

  CkdState copyWith({
    EnumCkd? ckdCalculated,
    bool? isValid,
    ValidCreatinine? validCreatinine,
    ValidCkd? validCkd,
    List<bool>? ckdSelected,
    EnumInputTypeCreatinine? inputTypeCreatinine,
    bool? isVisibleCreatinine,
  }) {
    return CkdState(
      ckdCalculated: ckdCalculated ?? this.ckdCalculated, 
      isValid: isValid ?? this.isValid, 
      validCreatinine: validCreatinine ?? this.validCreatinine, 
      validCkd: validCkd ?? this.validCkd, 
      ckdSelected: ckdSelected ?? this.ckdSelected, 
      inputTypeCreatinine: inputTypeCreatinine ?? this.inputTypeCreatinine, 
      isVisibleCreatinine: isVisibleCreatinine ?? this.isVisibleCreatinine, 
    );
  }

  String toJson() => json.encode(toMap());  
factory CkdState.fromJson(String source) => CkdState.fromMap(json.decode(source) as Map<String, dynamic>,);  
      
  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CkdState &&
            (identical(other.ckdCalculated, ckdCalculated) || other.ckdCalculated == ckdCalculated) && 
            (identical(other.isValid, isValid) || other.isValid == isValid) && 
            (identical(other.validCreatinine, validCreatinine) || other.validCreatinine == validCreatinine) && 
            (identical(other.validCkd, validCkd) || other.validCkd == validCkd) && 
            const DeepCollectionEquality().equals(other.ckdSelected, ckdSelected,) && 
            (identical(other.inputTypeCreatinine, inputTypeCreatinine) || other.inputTypeCreatinine == inputTypeCreatinine) && 
            (identical(other.isVisibleCreatinine, isVisibleCreatinine) || other.isVisibleCreatinine == isVisibleCreatinine));
  }
  
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        ckdCalculated,
        isValid,
        validCreatinine,
        validCkd,
        const DeepCollectionEquality().hash(ckdSelected,),
        inputTypeCreatinine,
        isVisibleCreatinine,
]);
      @override
  String toString() {
    return 'CkdState(ckdCalculated: $ckdCalculated, isValid: $isValid, validCreatinine: $validCreatinine, validCkd: $validCkd, ckdSelected: $ckdSelected, inputTypeCreatinine: $inputTypeCreatinine, isVisibleCreatinine: $isVisibleCreatinine, )';
    }

}
