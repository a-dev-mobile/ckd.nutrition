// ignore_for_file: sort_constructors_first

part of 'registration_cubit.dart';

/*  */
@immutable
class RegistrationState {    
  /* init: false */
  final bool isLoadPage;
/* init: false */
  final bool isLoadNextPage;
/* init: false */
  final bool isValid;
/* init: const [false,false] */
  final List<bool> activitySelected;

/* init: const [false,false] */
  final List<bool> hypertensionSelected;
/* init: const [false,false,false,false] */
  final List<bool> dailyDiuresisSelected;
/* 
type: enum
init: FormzSubmissionStatus.initial
*/
  final FormzSubmissionStatus status;
  /* init: const [] */
  final List<String> heightList;
  /* */
  final List<bool> diabetesSelected;

/* 
type: data
init: const ValidName.pure()
*/
  final ValidName validName;

/* 
type: data
init: const ValidActivity.pure()
*/
  final ValidActivity validActivity;



/* 
type: data
init: const ValidHeight.pure()
*/
  final ValidHeight validHeight;
/* 
type: data
init: const ValidWeight.pure()
*/
  final ValidWeight validWeight;

/* 
type: data
init: const ValidHypertension.pure()
*/
  final ValidHypertension validHypertension;

/* 
type: data
init: const ValidDiabetes.pure()
*/
  final ValidDiabetes validDiabetes;



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

  /* init: false */
  final bool isVisibleCreatinine;
  // end
   
//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  
  const RegistrationState({
    required this.diabetesSelected,
    this.isLoadPage = false,
    this.isLoadNextPage = false,
    this.isValid = false,
    this.activitySelected = const [false, false],
    this.hypertensionSelected = const [false, false],
    this.dailyDiuresisSelected = const [false, false, false, false],
    this.status = FormzSubmissionStatus.initial,
    this.heightList = const [],
    this.validName = const ValidName.pure(),
    this.validActivity = const ValidActivity.pure(),
    this.validHeight = const ValidHeight.pure(),
    this.validWeight = const ValidWeight.pure(),
    this.validHypertension = const ValidHypertension.pure(),
    this.validDiabetes = const ValidDiabetes.pure(),
    this.validDailyDiuresis = const ValidDailyDiuresis.pure(),
    this.validUrineOutput = const ValidUrineOutput.pure(),
    this.isVisibleUrineOutput = false,
    this.isVisibleCreatinine = false,
    this.gfrValue,
  });
  /*
   factory RegistrationState.init() => RegistrationState(
        diabetesSelected: const [],
      ); 
  */
Map<String, dynamic> toMap() {
  return <String, dynamic>{
      'isLoadPage': isLoadPage, 
      'isLoadNextPage': isLoadNextPage, 
      'isValid': isValid, 
      'activitySelected': activitySelected, 
      'hypertensionSelected': hypertensionSelected, 
      'dailyDiuresisSelected': dailyDiuresisSelected, 
      'status': status.index, 
      'heightList': heightList, 
      'diabetesSelected': diabetesSelected, 
      'validName': validName.toMap(), 
      'validActivity': validActivity.toMap(), 
      'validHeight': validHeight.toMap(), 
      'validWeight': validWeight.toMap(), 
      'validHypertension': validHypertension.toMap(), 
      'validDiabetes': validDiabetes.toMap(), 
      'gfrValue': gfrValue, 
      'validDailyDiuresis': validDailyDiuresis.toMap(), 
      'validUrineOutput': validUrineOutput.toMap(), 
      'isVisibleUrineOutput': isVisibleUrineOutput, 
      'isVisibleCreatinine': isVisibleCreatinine, 
    };
  }

    factory RegistrationState.fromMap(Map<String, dynamic> map) {
    return RegistrationState(
      isLoadPage: map['isLoadPage'] as bool? ?? false, 
      isLoadNextPage: map['isLoadNextPage'] as bool? ?? false, 
      isValid: map['isValid'] as bool? ?? false, 
      activitySelected: (map['activitySelected'] as List<dynamic>?)?.map((e) => e as bool).toList() ?? const [false, false], 
      hypertensionSelected: (map['hypertensionSelected'] as List<dynamic>?)?.map((e) => e as bool).toList() ?? const [false, false], 
      dailyDiuresisSelected: (map['dailyDiuresisSelected'] as List<dynamic>?)?.map((e) => e as bool).toList() ?? const [false, false, false, false], 
      status: FormzSubmissionStatus.values[map['status'] as int], 
      heightList: (map['heightList'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [], 
      diabetesSelected: (map['diabetesSelected'] as List<dynamic>).map((e) => e as bool).toList(), 
      validName: ValidName.fromMap(map['validName'] as Map<String, dynamic>,), 
      validActivity: ValidActivity.fromMap(map['validActivity'] as Map<String, dynamic>,), 
      validHeight: ValidHeight.fromMap(map['validHeight'] as Map<String, dynamic>,), 
      validWeight: ValidWeight.fromMap(map['validWeight'] as Map<String, dynamic>,), 
      validHypertension: ValidHypertension.fromMap(map['validHypertension'] as Map<String, dynamic>,), 
      validDiabetes: ValidDiabetes.fromMap(map['validDiabetes'] as Map<String, dynamic>,), 
      gfrValue: (map['gfrValue'] as num?)?.toDouble(), 
      validDailyDiuresis: ValidDailyDiuresis.fromMap(map['validDailyDiuresis'] as Map<String, dynamic>,), 
      validUrineOutput: ValidUrineOutput.fromMap(map['validUrineOutput'] as Map<String, dynamic>,), 
      isVisibleUrineOutput: map['isVisibleUrineOutput'] as bool? ?? false, 
      isVisibleCreatinine: map['isVisibleCreatinine'] as bool? ?? false, 
    );
  }

  RegistrationState copyWith({
    bool? isLoadPage,
    bool? isLoadNextPage,
    bool? isValid,
    List<bool>? activitySelected,
    List<bool>? hypertensionSelected,
    List<bool>? dailyDiuresisSelected,
    FormzSubmissionStatus? status,
    List<String>? heightList,
    List<bool>? diabetesSelected,
    ValidName? validName,
    ValidActivity? validActivity,
    ValidHeight? validHeight,
    ValidWeight? validWeight,
    ValidHypertension? validHypertension,
    ValidDiabetes? validDiabetes,
    double? gfrValue,
    ValidDailyDiuresis? validDailyDiuresis,
    ValidUrineOutput? validUrineOutput,
    bool? isVisibleUrineOutput,
    bool? isVisibleCreatinine,
  }) {
    return RegistrationState(
      isLoadPage: isLoadPage ?? this.isLoadPage, 
      isLoadNextPage: isLoadNextPage ?? this.isLoadNextPage, 
      isValid: isValid ?? this.isValid, 
      activitySelected: activitySelected ?? this.activitySelected, 
      hypertensionSelected: hypertensionSelected ?? this.hypertensionSelected, 
      dailyDiuresisSelected: dailyDiuresisSelected ?? this.dailyDiuresisSelected, 
      status: status ?? this.status, 
      heightList: heightList ?? this.heightList, 
      diabetesSelected: diabetesSelected ?? this.diabetesSelected, 
      validName: validName ?? this.validName, 
      validActivity: validActivity ?? this.validActivity, 
      validHeight: validHeight ?? this.validHeight, 
      validWeight: validWeight ?? this.validWeight, 
      validHypertension: validHypertension ?? this.validHypertension, 
      validDiabetes: validDiabetes ?? this.validDiabetes, 
      gfrValue: gfrValue ?? this.gfrValue, 
      validDailyDiuresis: validDailyDiuresis ?? this.validDailyDiuresis, 
      validUrineOutput: validUrineOutput ?? this.validUrineOutput, 
      isVisibleUrineOutput: isVisibleUrineOutput ?? this.isVisibleUrineOutput, 
      isVisibleCreatinine: isVisibleCreatinine ?? this.isVisibleCreatinine, 
    );
  }

  String toJson() => json.encode(toMap());  
factory RegistrationState.fromJson(String source) => RegistrationState.fromMap(json.decode(source) as Map<String, dynamic>,);  
      
  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegistrationState &&
            (identical(other.isLoadPage, isLoadPage) || other.isLoadPage == isLoadPage) && 
            (identical(other.isLoadNextPage, isLoadNextPage) || other.isLoadNextPage == isLoadNextPage) && 
            (identical(other.isValid, isValid) || other.isValid == isValid) && 
            const DeepCollectionEquality().equals(other.activitySelected, activitySelected,) && 
            const DeepCollectionEquality().equals(other.hypertensionSelected, hypertensionSelected,) && 
            const DeepCollectionEquality().equals(other.dailyDiuresisSelected, dailyDiuresisSelected,) && 
            (identical(other.status, status) || other.status == status) && 
            const DeepCollectionEquality().equals(other.heightList, heightList,) && 
            const DeepCollectionEquality().equals(other.diabetesSelected, diabetesSelected,) && 
            (identical(other.validName, validName) || other.validName == validName) && 
            (identical(other.validActivity, validActivity) || other.validActivity == validActivity) && 
            (identical(other.validHeight, validHeight) || other.validHeight == validHeight) && 
            (identical(other.validWeight, validWeight) || other.validWeight == validWeight) && 
            (identical(other.validHypertension, validHypertension) || other.validHypertension == validHypertension) && 
            (identical(other.validDiabetes, validDiabetes) || other.validDiabetes == validDiabetes) && 
            (identical(other.gfrValue, gfrValue) || other.gfrValue == gfrValue) && 
            (identical(other.validDailyDiuresis, validDailyDiuresis) || other.validDailyDiuresis == validDailyDiuresis) && 
            (identical(other.validUrineOutput, validUrineOutput) || other.validUrineOutput == validUrineOutput) && 
            (identical(other.isVisibleUrineOutput, isVisibleUrineOutput) || other.isVisibleUrineOutput == isVisibleUrineOutput) && 
            (identical(other.isVisibleCreatinine, isVisibleCreatinine) || other.isVisibleCreatinine == isVisibleCreatinine));
  }
  
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLoadPage,
        isLoadNextPage,
        isValid,
        const DeepCollectionEquality().hash(activitySelected,),
        const DeepCollectionEquality().hash(hypertensionSelected,),
        const DeepCollectionEquality().hash(dailyDiuresisSelected,),
        status,
        const DeepCollectionEquality().hash(heightList,),
        const DeepCollectionEquality().hash(diabetesSelected,),
        validName,
        validActivity,
        validHeight,
        validWeight,
        validHypertension,
        validDiabetes,
        gfrValue,
        validDailyDiuresis,
        validUrineOutput,
        isVisibleUrineOutput,
        isVisibleCreatinine,
]);
      @override
  String toString() {
    return 'RegistrationState(isLoadPage: $isLoadPage, isLoadNextPage: $isLoadNextPage, isValid: $isValid, activitySelected: $activitySelected, hypertensionSelected: $hypertensionSelected, dailyDiuresisSelected: $dailyDiuresisSelected, status: $status, heightList: $heightList, diabetesSelected: $diabetesSelected, validName: $validName, validActivity: $validActivity, validHeight: $validHeight, validWeight: $validWeight, validHypertension: $validHypertension, validDiabetes: $validDiabetes, gfrValue: $gfrValue, validDailyDiuresis: $validDailyDiuresis, validUrineOutput: $validUrineOutput, isVisibleUrineOutput: $isVisibleUrineOutput, isVisibleCreatinine: $isVisibleCreatinine, )';
    }

}
