// ignore_for_file: sort_constructors_first
import 'dart:convert';
import 'package:meta/meta.dart';

import 'package:nutrition/feature/registration/registration.dart';

/*  */
@immutable
class UserInfoModel {
  final String name;
  /* 

  init: EnumGender.none
   */
  final EnumGender gender;
  /* 

  init: EnumActivity.none
   */
  final EnumActivity activity;
  final DateTime birthday;
  final int height;
  final double weight;
/* 

  init: EnumCkd.none
   */
  final EnumCkd ckd;
  final double creatinin;
  final DateTime created;
  final DateTime? updated;
  // end

//          --TURN_GEN--
//  *************************************
//           GENERATED CODE
//  *************************************

  const UserInfoModel({
    required this.name,
    required this.birthday,
    required this.height,
    required this.weight,
    required this.creatinin,
    required this.created,
    this.gender = EnumGender.none,
    this.activity = EnumActivity.none,
    this.ckd = EnumCkd.none,
    this.updated,
  });
  /*
   factory UserInfoModel.init() => UserInfoModel(
        name: '',
        birthday: DateTime.now(),
        height: 0,
        weight: 0,
        creatinin: 0,
        created: DateTime.now(),
      ); 
  */
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'gender': gender.index,
      'activity': activity.index,
      'birthday': birthday.toIso8601String(),
      'height': height,
      'weight': weight,
      'ckd': ckd.index,
      'creatinin': creatinin,
      'created': created.toIso8601String(),
      'updated': updated?.toIso8601String(),
    };
  }

  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      name: map['name'] as String,
      gender: EnumGender.values[map['gender'] as int],
      activity: EnumActivity.values[map['activity'] as int],
      birthday: DateTime.parse(map['birthday'] as String),
      height: map['height'] as int,
      weight: (map['weight'] as num).toDouble(),
      ckd: EnumCkd.values[map['ckd'] as int],
      creatinin: (map['creatinin'] as num).toDouble(),
      created: DateTime.parse(map['created'] as String),
      updated: map['updated'] == null
          ? null
          : DateTime.parse(map['updated'] as String),
    );
  }

  UserInfoModel copyWith({
    String? name,
    EnumGender? gender,
    EnumActivity? activity,
    DateTime? birthday,
    int? height,
    double? weight,
    EnumCkd? ckd,
    double? creatinin,
    DateTime? created,
    DateTime? updated,
  }) {
    return UserInfoModel(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      activity: activity ?? this.activity,
      birthday: birthday ?? this.birthday,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      ckd: ckd ?? this.ckd,
      creatinin: creatinin ?? this.creatinin,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }

  String toJson() => json.encode(toMap());
  factory UserInfoModel.fromJson(String source) => UserInfoModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserInfoModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.ckd, ckd) || other.ckd == ckd) &&
            (identical(other.creatinin, creatinin) ||
                other.creatinin == creatinin) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        name,
        gender,
        activity,
        birthday,
        height,
        weight,
        ckd,
        creatinin,
        created,
        updated,
      ]);
  @override
  String toString() {
    return 'UserInfoModel(name: $name, gender: $gender, activity: $activity, birthday: $birthday, height: $height, weight: $weight, ckd: $ckd, creatinin: $creatinin, created: $created, updated: $updated, )';
  }
}
