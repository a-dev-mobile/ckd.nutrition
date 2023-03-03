// ignore_for_file: sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nutrition/core/enum/enum.dart';

@immutable
class MarkdownModel {
  /* init:'' */
  final String urlEN;
  /* init:'' */
  final String urlRU;

/* init: EnumWhatOpen.none type: enum */
  final EnumWhatOpen whatOpen;

  // end

//          --TURN_GEN--
//  *************************************
//           GENERATED CODE
//  *************************************

  const MarkdownModel({
    this.urlEN = '',
    this.urlRU = '',
    this.whatOpen = EnumWhatOpen.none,
  });
  /*
   factory MarkdownModel.init() => MarkdownModel(
      ); 
  */
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'urlEN': urlEN,
      'urlRU': urlRU,
      'whatOpen': whatOpen.index,
    };
  }

  factory MarkdownModel.fromMap(Map<String, dynamic> map) {
    return MarkdownModel(
      urlEN: map['urlEN'] as String? ?? '',
      urlRU: map['urlRU'] as String? ?? '',
      whatOpen: EnumWhatOpen.values[map['whatOpen'] as int],
    );
  }

  MarkdownModel copyWith({
    String? urlEN,
    String? urlRU,
    EnumWhatOpen? whatOpen,
  }) {
    return MarkdownModel(
      urlEN: urlEN ?? this.urlEN,
      urlRU: urlRU ?? this.urlRU,
      whatOpen: whatOpen ?? this.whatOpen,
    );
  }

  String toJson() => json.encode(toMap());
  factory MarkdownModel.fromJson(String source) => MarkdownModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MarkdownModel &&
            (identical(other.urlEN, urlEN) || other.urlEN == urlEN) &&
            (identical(other.urlRU, urlRU) || other.urlRU == urlRU) &&
            (identical(other.whatOpen, whatOpen) ||
                other.whatOpen == whatOpen));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        urlEN,
        urlRU,
        whatOpen,
      ]);
  @override
  String toString() {
    return 'MarkdownModel(urlEN: $urlEN, urlRU: $urlRU, whatOpen: $whatOpen, )';
  }
}
