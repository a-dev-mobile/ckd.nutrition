// ignore_for_file: sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:nutrition/core/storage/app_storage.dart';
import 'package:nutrition/navigation/navigation.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit({
    required AppRouter router,
    required AppStorage storage,
  })  : _go = router,
        _storage = storage,
        super(const OnboardingState());
  final AppStorage _storage;
  final AppRouter _go;
  void complectOnboarding() {
    _storage
      ..completeOnboarding()
      ..completeFirstStart();

    _go.nextPage();
  }
}

@immutable
class OnboardingState {
  /* init:false */
  final bool isLoad;
  // end

  //  ******************************
  // GENERATED CODE BELOW - DO NOT MODIFY
  //  ******************************

  const OnboardingState({
    this.isLoad = false,
  });
  /*
  
   factory OnboardingState.init() => OnboardingState(
      ); 
  */

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isLoad': isLoad,
    };
  }

  factory OnboardingState.fromMap(Map<String, dynamic> map) {
    return OnboardingState(
      isLoad: map['isLoad'] as bool? ?? false,
    );
  }

  OnboardingState copyWith({
    bool? isLoad,
  }) {
    return OnboardingState(
      isLoad: isLoad ?? this.isLoad,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnboardingState.fromJson(String source) =>
      OnboardingState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnboardingState &&
            (identical(other.isLoad, isLoad) || other.isLoad == isLoad));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLoad,
      ]);

  @override
  String toString() {
    return 'OnboardingState(isLoad: $isLoad, )';
  }
}
