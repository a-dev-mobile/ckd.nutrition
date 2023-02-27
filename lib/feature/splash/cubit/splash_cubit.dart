// ignore_for_file: sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nutrition/core/storage/app_storage.dart';
import 'package:nutrition/navigation/app_router.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required AppRouter router,
    required AppStorage storage,
  })  : _go = router,
        _storage = storage,
        super(const SplashState());

  final AppRouter _go;
  final AppStorage _storage;

  void load()  {
    final _ =  _storage.completeFirstStart();

     _go.nextPage();
  }
}

@immutable
class SplashState {
  /* init:true */
  final bool isLoad;
  // end

  //  ******************************
  // GENERATED CODE BELOW - DO NOT MODIFY
  //  ******************************

  const SplashState({
    this.isLoad = true,
  });
  /*
  
   factory SplashState.init() => SplashState(
      ); 
  */

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isLoad': isLoad,
    };
  }

  factory SplashState.fromMap(Map<String, dynamic> map) {
    return SplashState(
      isLoad: map['isLoad'] as bool? ?? true,
    );
  }

  SplashState copyWith({
    bool? isLoad,
  }) {
    return SplashState(
      isLoad: isLoad ?? this.isLoad,
    );
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

  @override
  String toString() {
    return 'SplashState(isLoad: $isLoad, )';
  }
}
