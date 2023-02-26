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
/* 
type: data
init: const ValidName.pure()
*/
  final ValidName validName;

  // end
   
//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  
  const RegistrationState({
    this.isLoadPage = false,
    this.isLoadNextPage = false,
    this.isValid = false,
    this.validName = const ValidName.pure(),
  });
  /*
   factory RegistrationState.init() => RegistrationState(
      ); 
  */
Map<String, dynamic> toMap() {
  return <String, dynamic>{
      'isLoadPage': isLoadPage, 
      'isLoadNextPage': isLoadNextPage, 
      'isValid': isValid, 
      'validName': validName.toMap(), 
    };
  }

    factory RegistrationState.fromMap(Map<String, dynamic> map) {
    return RegistrationState(
      isLoadPage: map['isLoadPage'] as bool? ?? false, 
      isLoadNextPage: map['isLoadNextPage'] as bool? ?? false, 
      isValid: map['isValid'] as bool? ?? false, 
      validName: ValidName.fromMap(map['validName'] as Map<String, dynamic>,), 
    );
  }

  RegistrationState copyWith({
    bool? isLoadPage,
    bool? isLoadNextPage,
    bool? isValid,
    ValidName? validName,
  }) {
    return RegistrationState(
      isLoadPage: isLoadPage ?? this.isLoadPage, 
      isLoadNextPage: isLoadNextPage ?? this.isLoadNextPage, 
      isValid: isValid ?? this.isValid, 
      validName: validName ?? this.validName, 
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
            (identical(other.validName, validName) || other.validName == validName));
  }
  
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLoadPage,
        isLoadNextPage,
        isValid,
        validName,
]);
      @override
  String toString() {
    return 'RegistrationState(isLoadPage: $isLoadPage, isLoadNextPage: $isLoadNextPage, isValid: $isValid, validName: $validName, )';
    }

}
