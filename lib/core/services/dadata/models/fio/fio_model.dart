// ignore_for_file: sort_constructors_first, avoid_bool_literals_in_conditional_expressions, non_constant_identifier_names
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:nutrition/core/services/dadata/dadata.dart';

@immutable
class Fio { 
/* init: const[] */
  final List<SuggestionsFio> suggestions;

  // end
   
//          --TURN_GEN--
//             v0.3.2
//  *************************************
//           GENERATED CODE 
//  *************************************
  
  const Fio({
    this.suggestions = const[],
  });
  /*
   factory Fio.init() => Fio(
      ); 
  */
Map<String, dynamic> toMap() {
  return <String, dynamic>{
      'suggestions': suggestions.map((e) => e.toMap()).toList(), 
    };
  }

  factory Fio.fromMap(Map<String, dynamic>? map) {
    if (map == null) return const Fio();

    return Fio(
      suggestions: map['suggestions'] != null ? (map['suggestions'] as List<dynamic>).map((e) => SuggestionsFio.fromMap(e as Map<String, dynamic>)).toList() : const[], 
    );
  }

  Fio copyWith({
    List<SuggestionsFio>? suggestions,
  }) {
    return Fio(
      suggestions: suggestions ?? this.suggestions, 
    );
  }

  String toJson() => json.encode(toMap());  
factory Fio.fromJson(String source) => Fio.fromMap(json.decode(source) as Map<String, dynamic>,);  
      
  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Fio &&
            const DeepCollectionEquality().equals(other.suggestions, suggestions,));
  }
  
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(suggestions,),
]);
      @override
  String toString() {
    return 'Fio(suggestions: $suggestions, )';
    }

}
