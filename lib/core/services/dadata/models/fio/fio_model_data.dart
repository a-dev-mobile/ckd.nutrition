// ignore_for_file: sort_constructors_first, avoid_bool_literals_in_conditional_expressions
import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class DataFio {
  /* init:'' */
  final String surname;
  /* init:'' */
  final String name;
  /* init:'' */
  final String patronymic;
  /* init:'' */
  final String gender;
  /* init:'' */
  final String source;
  /* init:'' */
  final String qc;

// end

//          --TURN_GEN--
//             v0.4.1
//  *************************************
//           GENERATED CODE
//  *************************************

  const DataFio({
    this.surname = '',
    this.name = '',
    this.patronymic = '',
    this.gender = '',
    this.source = '',
    this.qc = '',
  });
  /*
   factory DataFio.init() => DataFio(
      ); 
  */
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'surname': surname,
      'name': name,
      'patronymic': patronymic,
      'gender': gender,
      'source': source,
      'qc': qc,
    };
  }

  factory DataFio.fromMap(Map<String, dynamic>? map) {
    if (map == null) return const DataFio();

    return DataFio(
      surname: map['surname'] != null ? map['surname'] as String : '',
      name: map['name'] != null ? map['name'] as String : '',
      patronymic: map['patronymic'] != null ? map['patronymic'] as String : '',
      gender: map['gender'] != null ? map['gender'] as String : '',
      source: map['source'] != null ? map['source'] as String : '',
      qc: map['qc'] != null ? map['qc'] as String : '',
    );
  }

  DataFio copyWith({
    String? surname,
    String? name,
    String? patronymic,
    String? gender,
    String? source,
    String? qc,
  }) {
    return DataFio(
      surname: surname ?? this.surname,
      name: name ?? this.name,
      patronymic: patronymic ?? this.patronymic,
      gender: gender ?? this.gender,
      source: source ?? this.source,
      qc: qc ?? this.qc,
    );
  }

  String toJson() => json.encode(toMap());
  factory DataFio.fromJson(String source) => DataFio.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataFio &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.patronymic, patronymic) ||
                other.patronymic == patronymic) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.qc, qc) || other.qc == qc));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        surname,
        name,
        patronymic,
        gender,
        source,
        qc,
      ]);
  @override
  String toString() {
    return 'DataFio(surname: $surname, name: $name, patronymic: $patronymic, gender: $gender, source: $source, qc: $qc, )';
  }
}
