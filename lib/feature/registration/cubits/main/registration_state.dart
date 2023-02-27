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


  // end
   
//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  
  const RegistrationState({
    this.isLoadPage = false,
    this.isLoadNextPage = false,
    this.isValid = false,
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
    };
  }

    factory RegistrationState.fromMap(Map<String, dynamic> map) {
    return RegistrationState(
      isLoadPage: map['isLoadPage'] as bool? ?? false, 
      isLoadNextPage: map['isLoadNextPage'] as bool? ?? false, 
      isValid: map['isValid'] as bool? ?? false, 
    );
  }

  RegistrationState copyWith({
    bool? isLoadPage,
    bool? isLoadNextPage,
    bool? isValid,
  }) {
    return RegistrationState(
      isLoadPage: isLoadPage ?? this.isLoadPage, 
      isLoadNextPage: isLoadNextPage ?? this.isLoadNextPage, 
      isValid: isValid ?? this.isValid, 
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
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }
  
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLoadPage,
        isLoadNextPage,
        isValid,
]);
      @override
  String toString() {
    return 'RegistrationState(isLoadPage: $isLoadPage, isLoadNextPage: $isLoadNextPage, isValid: $isValid, )';
    }

}
