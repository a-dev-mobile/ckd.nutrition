// ignore_for_file: sort_constructors_first

part of 'activity_cubit.dart';

/*  */
@immutable
class ActivityState { 
  /* init: false */
  final bool isValid;

/* init: const [false,false] */
  final List<bool> activitySelected;

/* 
type: data
init: const ValidActivity.pure()
*/
  final ValidActivity validActivity;

  // end
   
//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  
  const ActivityState({
    this.isValid = false,
    this.activitySelected = const [false, false],
    this.validActivity = const ValidActivity.pure(),
  });
  /*
   factory ActivityState.init() => ActivityState(
      ); 
  */
Map<String, dynamic> toMap() {
  return <String, dynamic>{
      'isValid': isValid, 
      'activitySelected': activitySelected, 
      'validActivity': validActivity.toMap(), 
    };
  }

    factory ActivityState.fromMap(Map<String, dynamic> map) {
    return ActivityState(
      isValid: map['isValid'] as bool? ?? false, 
      activitySelected: (map['activitySelected'] as List<dynamic>?)?.map((e) => e as bool).toList() ?? const [false, false], 
      validActivity: ValidActivity.fromMap(map['validActivity'] as Map<String, dynamic>,), 
    );
  }

  ActivityState copyWith({
    bool? isValid,
    List<bool>? activitySelected,
    ValidActivity? validActivity,
  }) {
    return ActivityState(
      isValid: isValid ?? this.isValid, 
      activitySelected: activitySelected ?? this.activitySelected, 
      validActivity: validActivity ?? this.validActivity, 
    );
  }

  String toJson() => json.encode(toMap());  
factory ActivityState.fromJson(String source) => ActivityState.fromMap(json.decode(source) as Map<String, dynamic>,);  
      
  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityState &&
            (identical(other.isValid, isValid) || other.isValid == isValid) && 
            const DeepCollectionEquality().equals(other.activitySelected, activitySelected,) && 
            (identical(other.validActivity, validActivity) || other.validActivity == validActivity));
  }
  
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isValid,
        const DeepCollectionEquality().hash(activitySelected,),
        validActivity,
]);
      @override
  String toString() {
    return 'ActivityState(isValid: $isValid, activitySelected: $activitySelected, validActivity: $validActivity, )';
    }

}
