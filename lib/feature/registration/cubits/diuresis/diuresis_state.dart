// ignore_for_file: sort_constructors_first

part of 'diuresis_cubit.dart';

/*  */
@immutable
class DiuresisState { 
  /* init: false */
  final bool isValid;

/* init: const [false, false, false, false] */
  final List<bool> dailyDiuresisSelected;

/*  */
  final double? gfrValue;

/* 
type: data
init: const ValidDailyDiuresis.pure()
*/
  final ValidDailyDiuresis validDailyDiuresis;

/* 
type: data
init: const ValidUrineOutput.pure()
*/
  final ValidUrineOutput validUrineOutput;
/* init: false */
  final bool isVisibleUrineOutput;

  // end
   
//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  
  const DiuresisState({
    this.isValid = false,
    this.dailyDiuresisSelected = const [false, false, false, false],
    this.validDailyDiuresis = const ValidDailyDiuresis.pure(),
    this.validUrineOutput = const ValidUrineOutput.pure(),
    this.isVisibleUrineOutput = false,
    this.gfrValue,
  });
  /*
   factory DiuresisState.init() => DiuresisState(
      ); 
  */
Map<String, dynamic> toMap() {
  return <String, dynamic>{
      'isValid': isValid, 
      'dailyDiuresisSelected': dailyDiuresisSelected, 
      'gfrValue': gfrValue, 
      'validDailyDiuresis': validDailyDiuresis.toMap(), 
      'validUrineOutput': validUrineOutput.toMap(), 
      'isVisibleUrineOutput': isVisibleUrineOutput, 
    };
  }

    factory DiuresisState.fromMap(Map<String, dynamic> map) {
    return DiuresisState(
      isValid: map['isValid'] as bool? ?? false, 
      dailyDiuresisSelected: (map['dailyDiuresisSelected'] as List<dynamic>?)?.map((e) => e as bool).toList() ?? const [false, false, false, false], 
      gfrValue: (map['gfrValue'] as num?)?.toDouble(), 
      validDailyDiuresis: ValidDailyDiuresis.fromMap(map['validDailyDiuresis'] as Map<String, dynamic>,), 
      validUrineOutput: ValidUrineOutput.fromMap(map['validUrineOutput'] as Map<String, dynamic>,), 
      isVisibleUrineOutput: map['isVisibleUrineOutput'] as bool? ?? false, 
    );
  }

  DiuresisState copyWith({
    bool? isValid,
    List<bool>? dailyDiuresisSelected,
    double? gfrValue,
    ValidDailyDiuresis? validDailyDiuresis,
    ValidUrineOutput? validUrineOutput,
    bool? isVisibleUrineOutput,
  }) {
    return DiuresisState(
      isValid: isValid ?? this.isValid, 
      dailyDiuresisSelected: dailyDiuresisSelected ?? this.dailyDiuresisSelected, 
      gfrValue: gfrValue ?? this.gfrValue, 
      validDailyDiuresis: validDailyDiuresis ?? this.validDailyDiuresis, 
      validUrineOutput: validUrineOutput ?? this.validUrineOutput, 
      isVisibleUrineOutput: isVisibleUrineOutput ?? this.isVisibleUrineOutput, 
    );
  }

  String toJson() => json.encode(toMap());  
factory DiuresisState.fromJson(String source) => DiuresisState.fromMap(json.decode(source) as Map<String, dynamic>,);  
      
  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DiuresisState &&
            (identical(other.isValid, isValid) || other.isValid == isValid) && 
            const DeepCollectionEquality().equals(other.dailyDiuresisSelected, dailyDiuresisSelected,) && 
            (identical(other.gfrValue, gfrValue) || other.gfrValue == gfrValue) && 
            (identical(other.validDailyDiuresis, validDailyDiuresis) || other.validDailyDiuresis == validDailyDiuresis) && 
            (identical(other.validUrineOutput, validUrineOutput) || other.validUrineOutput == validUrineOutput) && 
            (identical(other.isVisibleUrineOutput, isVisibleUrineOutput) || other.isVisibleUrineOutput == isVisibleUrineOutput));
  }
  
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isValid,
        const DeepCollectionEquality().hash(dailyDiuresisSelected,),
        gfrValue,
        validDailyDiuresis,
        validUrineOutput,
        isVisibleUrineOutput,
]);
      @override
  String toString() {
    return 'DiuresisState(isValid: $isValid, dailyDiuresisSelected: $dailyDiuresisSelected, gfrValue: $gfrValue, validDailyDiuresis: $validDailyDiuresis, validUrineOutput: $validUrineOutput, isVisibleUrineOutput: $isVisibleUrineOutput, )';
    }

}
