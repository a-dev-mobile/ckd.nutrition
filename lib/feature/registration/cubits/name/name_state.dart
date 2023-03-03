// ignore_for_file: sort_constructors_first

part of 'name_cubit.dart';

/*  */
@immutable
class NameState {   
/* init: false */
  final bool isValid;
/* 
init: const ValidName.pure()
*/
final ValidName validName;

  // end
   
//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  
  const NameState({
    this.isValid = false,
    this.validName = const ValidName.pure(),
  });
  /*
   factory NameState.init() => NameState(
      ); 
  */
Map<String, dynamic> toMap() {
  return <String, dynamic>{
      'isValid': isValid, 
      'validName': validName.toMap(), 
    };
  }

    factory NameState.fromMap(Map<String, dynamic> map) {
    return NameState(
      isValid: map['isValid'] as bool? ?? false, 
      validName: ValidName.fromMap(map['validName'] as Map<String, dynamic>,), 
    );
  }

  NameState copyWith({
    bool? isValid,
    ValidName? validName,
  }) {
    return NameState(
      isValid: isValid ?? this.isValid, 
      validName: validName ?? this.validName, 
    );
  }

  String toJson() => json.encode(toMap());  
factory NameState.fromJson(String source) => NameState.fromMap(json.decode(source) as Map<String, dynamic>,);  
      
  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NameState &&
            (identical(other.isValid, isValid) || other.isValid == isValid) && 
            (identical(other.validName, validName) || other.validName == validName));
  }
  
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isValid,
        validName,
]);
      @override
  String toString() {
    return 'NameState(isValid: $isValid, validName: $validName, )';
    }

}
