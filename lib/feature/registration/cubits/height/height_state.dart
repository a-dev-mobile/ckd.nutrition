// ignore_for_file: sort_constructors_first

part of 'height_cubit.dart';

/*  */
@immutable
class HeightState {   
  /* init: false */
  final bool isValid;

  /* init: const [] */
  final List<String> heightList;

/* 
init: const ValidHeight.pure()
*/
  final ValidHeight validheight;

  // end
   
//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  
  const HeightState({
    this.isValid = false,
    this.heightList = const [],
    this.validheight = const ValidHeight.pure(),
  });
  /*
   factory HeightState.init() => HeightState(
      ); 
  */
Map<String, dynamic> toMap() {
  return <String, dynamic>{
      'isValid': isValid, 
      'heightList': heightList, 
      'validheight': validheight.toMap(), 
    };
  }

    factory HeightState.fromMap(Map<String, dynamic> map) {
    return HeightState(
      isValid: map['isValid'] as bool? ?? false, 
      heightList: (map['heightList'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [], 
      validheight: ValidHeight.fromMap(map['validheight'] as Map<String, dynamic>,), 
    );
  }

  HeightState copyWith({
    bool? isValid,
    List<String>? heightList,
    ValidHeight? validheight,
  }) {
    return HeightState(
      isValid: isValid ?? this.isValid, 
      heightList: heightList ?? this.heightList, 
      validheight: validheight ?? this.validheight, 
    );
  }

  String toJson() => json.encode(toMap());  
factory HeightState.fromJson(String source) => HeightState.fromMap(json.decode(source) as Map<String, dynamic>,);  
      
  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HeightState &&
            (identical(other.isValid, isValid) || other.isValid == isValid) && 
            const DeepCollectionEquality().equals(other.heightList, heightList,) && 
            (identical(other.validheight, validheight) || other.validheight == validheight));
  }
  
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isValid,
        const DeepCollectionEquality().hash(heightList,),
        validheight,
]);
      @override
  String toString() {
    return 'HeightState(isValid: $isValid, heightList: $heightList, validheight: $validheight, )';
    }

}
