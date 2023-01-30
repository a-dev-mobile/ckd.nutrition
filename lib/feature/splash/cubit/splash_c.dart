// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition/feature/welcome/view/welcome_page.dart';
import 'package:nutrition/navigation/app_router.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required AppRouter router,
  })  : _go = router,
        super(const SplashState());

  final AppRouter _go;

  Future<void> load() async {
    emit(state.copyWith(isLoad: true));

    _go.router.goNamed(WelcomePage.name);

    emit(state.copyWith(isLoad: false));
  }
}

@immutable
class SplashState {
  /* init:false */
  final bool isLoad;
  // end

  //  ******************************
  // GENERATED CODE BELOW - DO NOT MODIFY
  //  ******************************

  const SplashState({
    this.isLoad = false,
  });
  /*
   factory SplashState.init() => SplashState(
      ); 
  */

  SplashState copyWith({
    bool? isLoad,
  }) {
    return SplashState(
      isLoad: isLoad ?? this.isLoad,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isLoad': isLoad,
    };
  }

  factory SplashState.fromMap(Map<String, dynamic> map) {
    return SplashState(
      isLoad: map['isLoad'] as bool? ?? false,
    );
  }
  @override
  String toString() {
    return 'SplashState(isLoad: $isLoad, )';
  }

  String toJson() => json.encode(toMap());

  factory SplashState.fromJson(String source) =>
      SplashState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SplashState &&
            (identical(other.isLoad, isLoad) || other.isLoad == isLoad));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLoad,
      ]);
}
