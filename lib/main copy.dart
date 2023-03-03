import 'dart:convert';
// ignore_for_file: sort_constructors_first
// ignore_for_file: prefer_const_constructors_in_immutables,

import 'package:turn_gen/src/src.dart';

class Varable {   
/* type: enum 
init: EnumTypeVarable.none
 */
  final EnumTypeVarable type;
  /* init:'' */
  //variable name
  final String nameVar;
    /* init:'' */
  //variable type name
  final String nameClass;
  /* init:'' */
  //variable type name
  final String nameData;
  /* init:'' */
  final String initValueDefault;
  /* init:'' */
  final String initValueComment;
  /* init:'' */ 
  final String toMap_;
  /* init:'' */
  final String fromMap_;
  /* init:false */
  final bool isCanNull;
  /* init:false */
  final bool isArray;
  /* type: enum 
init: EnumTypeVarable.none
 */
  final EnumTypeVarable typeArray;
// end
   
//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  
  const Varable({
    this.type = EnumTypeVarable.none,
    this.nameVar = '',
    this.nameClass = '',
    this.nameData = '',
    this.initValueDefault = '',
    this.initValueComment = '',
    this.toMap_ = '',
    this.fromMap_ = '',
    this.isCanNull = false,
    this.isArray = false,
    this.typeArray = EnumTypeVarable.none,
  });
  /*
   factory Varable.init() => Varable(
      ); 
  */
Map<String, dynamic> toMap() {
  return <String, dynamic>{
      'type': type.index, 
      'nameVar': nameVar, 
      'nameClass': nameClass, 
      'nameData': nameData, 
      'initValueDefault': initValueDefault, 
      'initValueComment': initValueComment, 
      'toMap_': toMap_, 
      'fromMap_': fromMap_, 
      'isCanNull': isCanNull, 
      'isArray': isArray, 
      'typeArray': typeArray.index, 
    };
  }

    factory Varable.fromMap(Map<String, dynamic> map) {
    return Varable(
      type: EnumTypeVarable.values[map['type'] as int], 
      nameVar: map['nameVar'] as String? ?? '' , 
      nameClass: map['nameClass'] as String? ?? '' , 
      nameData: map['nameData'] as String? ?? '' , 
      initValueDefault: map['initValueDefault'] as String? ?? '' , 
      initValueComment: map['initValueComment'] as String? ?? '' , 
      toMap_: map['toMap_'] as String? ?? '' , 
      fromMap_: map['fromMap_'] as String? ?? '' , 
      isCanNull: map['isCanNull'] as bool? ?? false, 
      isArray: map['isArray'] as bool? ?? false, 
      typeArray: EnumTypeVarable.values[map['typeArray'] as int], 
    );
  }

  Varable copyWith({
    EnumTypeVarable? type,
    String? nameVar,
    String? nameClass,
    String? nameData,
    String? initValueDefault,
    String? initValueComment,
    String? toMap_,
    String? fromMap_,
    bool? isCanNull,
    bool? isArray,
    EnumTypeVarable? typeArray,
  }) {
    return Varable(
      type: type ?? this.type, 
      nameVar: nameVar ?? this.nameVar, 
      nameClass: nameClass ?? this.nameClass, 
      nameData: nameData ?? this.nameData, 
      initValueDefault: initValueDefault ?? this.initValueDefault, 
      initValueComment: initValueComment ?? this.initValueComment, 
      toMap_: toMap_ ?? this.toMap_, 
      fromMap_: fromMap_ ?? this.fromMap_, 
      isCanNull: isCanNull ?? this.isCanNull, 
      isArray: isArray ?? this.isArray, 
      typeArray: typeArray ?? this.typeArray, 
    );
  }

  String toJson() => json.encode(toMap());  
factory Varable.fromJson(String source) => Varable.fromMap(json.decode(source) as Map<String, dynamic>,);  
      
  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Varable &&
            (identical(other.type, type) || other.type == type) && 
            (identical(other.nameVar, nameVar) || other.nameVar == nameVar) && 
            (identical(other.nameClass, nameClass) || other.nameClass == nameClass) && 
            (identical(other.nameData, nameData) || other.nameData == nameData) && 
            (identical(other.initValueDefault, initValueDefault) || other.initValueDefault == initValueDefault) && 
            (identical(other.initValueComment, initValueComment) || other.initValueComment == initValueComment) && 
            (identical(other.toMap_, toMap_) || other.toMap_ == toMap_) && 
            (identical(other.fromMap_, fromMap_) || other.fromMap_ == fromMap_) && 
            (identical(other.isCanNull, isCanNull) || other.isCanNull == isCanNull) && 
            (identical(other.isArray, isArray) || other.isArray == isArray) && 
            (identical(other.typeArray, typeArray) || other.typeArray == typeArray));
  }
  
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        type,
        nameVar,
        nameClass,
        nameData,
        initValueDefault,
        initValueComment,
        toMap_,
        fromMap_,
        isCanNull,
        isArray,
        typeArray,
]);
      @override
  String toString() {
    return 'Varable(type: $type, nameVar: $nameVar, nameClass: $nameClass, nameData: $nameData, initValueDefault: $initValueDefault, initValueComment: $initValueComment, toMap_: $toMap_, fromMap_: $fromMap_, isCanNull: $isCanNull, isArray: $isArray, typeArray: $typeArray, )';
    }

}
