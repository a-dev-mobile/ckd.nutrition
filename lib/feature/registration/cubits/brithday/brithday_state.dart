// ignore_for_file: sort_constructors_first

part of 'brithday_cubit.dart';

/*  */
@immutable
class BrithdayState {
/* init: false */
  final bool isValid;

  final String? daySelected;

  final String? yearSelected;

  final String? monthSelected;

/* 
type: data
init: const DateRegModel()
*/
  final DateRegModel dateRegModel;

/* 
type: data
init: const ValidBirthday.pure()
*/
  final ValidBirthday validBirthday;

  // end

//          --TURN_GEN--
//  *************************************
//           GENERATED CODE
//  *************************************

  const BrithdayState({
    this.isValid = false,
    this.dateRegModel = const DateRegModel(),
    this.validBirthday = const ValidBirthday.pure(),
    this.daySelected,
    this.yearSelected,
    this.monthSelected,
  });
  /*
   factory BrithdayState.init() => BrithdayState(
      ); 
  */
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isValid': isValid,
      'daySelected': daySelected,
      'yearSelected': yearSelected,
      'monthSelected': monthSelected,
      'dateRegModel': dateRegModel.toMap(),
      'validBirthday': validBirthday.toMap(),
    };
  }

  factory BrithdayState.fromMap(Map<String, dynamic> map) {
    return BrithdayState(
      isValid: map['isValid'] as bool? ?? false,
      daySelected: map['daySelected'] as String?,
      yearSelected: map['yearSelected'] as String?,
      monthSelected: map['monthSelected'] as String?,
      dateRegModel: DateRegModel.fromMap(
        map['dateRegModel'] as Map<String, dynamic>,
      ),
      validBirthday: ValidBirthday.fromMap(
        map['validBirthday'] as Map<String, dynamic>,
      ),
    );
  }

  BrithdayState copyWith({
    bool? isValid,
    String? daySelected,
    String? yearSelected,
    String? monthSelected,
    DateRegModel? dateRegModel,
    ValidBirthday? validBirthday,
  }) {
    return BrithdayState(
      isValid: isValid ?? this.isValid,
      daySelected: daySelected ?? this.daySelected,
      yearSelected: yearSelected ?? this.yearSelected,
      monthSelected: monthSelected ?? this.monthSelected,
      dateRegModel: dateRegModel ?? this.dateRegModel,
      validBirthday: validBirthday ?? this.validBirthday,
    );
  }

  String toJson() => json.encode(toMap());
  factory BrithdayState.fromJson(String source) => BrithdayState.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BrithdayState &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.daySelected, daySelected) ||
                other.daySelected == daySelected) &&
            (identical(other.yearSelected, yearSelected) ||
                other.yearSelected == yearSelected) &&
            (identical(other.monthSelected, monthSelected) ||
                other.monthSelected == monthSelected) &&
            (identical(other.dateRegModel, dateRegModel) ||
                other.dateRegModel == dateRegModel) &&
            (identical(other.validBirthday, validBirthday) ||
                other.validBirthday == validBirthday));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isValid,
        daySelected,
        yearSelected,
        monthSelected,
        dateRegModel,
        validBirthday,
      ]);
  @override
  String toString() {
    return 'BrithdayState(isValid: $isValid, daySelected: $daySelected, yearSelected: $yearSelected, monthSelected: $monthSelected, dateRegModel: $dateRegModel, validBirthday: $validBirthday, )';
  }
}
