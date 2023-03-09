// ignore_for_file: sort_constructors_first, avoid_bool_literals_in_conditional_expressions, non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nutrition/core/services/dadata/dadata.dart';

@immutable
class SuggestionsFio {   
  /* init: '' */
  final String value;
  /* init: '' */
  final String unrestricted_value;
  /* init: const DataFio() */
  final DataFio data;

  // end
   
//          --TURN_GEN--
//             v0.3.2
//  *************************************
//           GENERATED CODE 
//  *************************************
  
  const SuggestionsFio({
    this.value = '',
    this.unrestricted_value = '',
    this.data = const DataFio(),
  });
  /*
   factory SuggestionsFio.init() => SuggestionsFio(
      ); 
  */
Map<String, dynamic> toMap() {
  return <String, dynamic>{
      'value': value, 
      'unrestricted_value': unrestricted_value, 
      'data': data.toMap(), 
    };
  }

  factory SuggestionsFio.fromMap(Map<String, dynamic>? map) {
    if (map == null) return const SuggestionsFio();

    return SuggestionsFio(
      value: map['value'] != null ? map['value'] as String : '', 
      unrestricted_value: map['unrestricted_value'] != null ? map['unrestricted_value'] as String : '', 
      data: map['data'] != null ? DataFio.fromMap(map['data'] as Map<String, dynamic>) : const DataFio(), 
    );
  }

  SuggestionsFio copyWith({
    String? value,
    String? unrestricted_value,
    DataFio? data,
  }) {
    return SuggestionsFio(
      value: value ?? this.value, 
      unrestricted_value: unrestricted_value ?? this.unrestricted_value, 
      data: data ?? this.data, 
    );
  }

  String toJson() => json.encode(toMap());  
factory SuggestionsFio.fromJson(String source) => SuggestionsFio.fromMap(json.decode(source) as Map<String, dynamic>,);  
      
  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuggestionsFio &&
            (identical(other.value, value) || other.value == value) && 
            (identical(other.unrestricted_value, unrestricted_value) || other.unrestricted_value == unrestricted_value) && 
            (identical(other.data, data) || other.data == data));
  }
  
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        value,
        unrestricted_value,
        data,
]);
      @override
  String toString() {
    return 'SuggestionsFio(value: $value, unrestricted_value: $unrestricted_value, data: $data, )';
    }

}
