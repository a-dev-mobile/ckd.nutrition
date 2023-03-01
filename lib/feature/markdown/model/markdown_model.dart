// ignore_for_file: sort_constructors_first


import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class MarkdownModel {  
  /*  */
  final String urlEN;
  /*  */
  final String urlRU;
  // end
   
//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  
  const MarkdownModel({
    required this.urlEN,
    required this.urlRU,
  });
  /*
   factory MarkdownModel.init() => MarkdownModel(
        urlEN: '',
        urlRU: '',
      ); 
  */
Map<String, dynamic> toMap() {
  return <String, dynamic>{
      'urlEN': urlEN, 
      'urlRU': urlRU, 
    };
  }

    factory MarkdownModel.fromMap(Map<String, dynamic> map) {
    return MarkdownModel(
      urlEN: map['urlEN'] as String, 
      urlRU: map['urlRU'] as String, 
    );
  }

  MarkdownModel copyWith({
    String? urlEN,
    String? urlRU,
  }) {
    return MarkdownModel(
      urlEN: urlEN ?? this.urlEN, 
      urlRU: urlRU ?? this.urlRU, 
    );
  }

  String toJson() => json.encode(toMap());  
factory MarkdownModel.fromJson(String source) => MarkdownModel.fromMap(json.decode(source) as Map<String, dynamic>,);  
      
  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MarkdownModel &&
            (identical(other.urlEN, urlEN) || other.urlEN == urlEN) && 
            (identical(other.urlRU, urlRU) || other.urlRU == urlRU));
  }
  
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        urlEN,
        urlRU,
]);
      @override
  String toString() {
    return 'MarkdownModel(urlEN: $urlEN, urlRU: $urlRU, )';
    }

}
