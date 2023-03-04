// ignore_for_file: sort_constructors_first

import 'dart:convert';

import 'package:meta/meta.dart';

@immutable
class RemoteConfigState { 


  /* init: true */
  final bool isLoad;
  /* init: false */
  final bool isNeedUpdate;
  // end
   
//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  
  const RemoteConfigState({
    this.isLoad = true,
    this.isNeedUpdate = false,
  });
  /*
   factory RemoteConfigState.init() => RemoteConfigState(
      ); 
  */
Map<String, dynamic> toMap() {
  return <String, dynamic>{
      'isLoad': isLoad, 
      'isNeedUpdate': isNeedUpdate, 
    };
  }

    factory RemoteConfigState.fromMap(Map<String, dynamic> map) {
    return RemoteConfigState(
      isLoad: map['isLoad'] as bool? ?? true, 
      isNeedUpdate: map['isNeedUpdate'] as bool? ?? false, 
    );
  }

  RemoteConfigState copyWith({
    bool? isLoad,
    bool? isNeedUpdate,
  }) {
    return RemoteConfigState(
      isLoad: isLoad ?? this.isLoad, 
      isNeedUpdate: isNeedUpdate ?? this.isNeedUpdate, 
    );
  }

  String toJson() => json.encode(toMap());  
factory RemoteConfigState.fromJson(String source) => RemoteConfigState.fromMap(json.decode(source) as Map<String, dynamic>,);  
      
  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemoteConfigState &&
            (identical(other.isLoad, isLoad) || other.isLoad == isLoad) && 
            (identical(other.isNeedUpdate, isNeedUpdate) || other.isNeedUpdate == isNeedUpdate));
  }
  
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLoad,
        isNeedUpdate,
]);
      @override
  String toString() {
    return 'RemoteConfigState(isLoad: $isLoad, isNeedUpdate: $isNeedUpdate, )';
    }

}
