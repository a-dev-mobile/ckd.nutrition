

import 'package:meta/meta.dart';

class _SplashState {
  const _SplashState.init();
  const _SplashState.success();
}

// end

//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  
// coverage:ignore-file
// ignore_for_file: avoid_unused_constructor_parameters, unused_element, avoid-non-null-assertion,  library_private_types_in_public_api,non_constant_identifier_names, always_put_required_named_parameters_first,  avoid_positional_boolean_parameters, strict_raw_type
@immutable
class SplashState {
  const SplashState.init():
        _tag = _SplashStateTag.init;
  const SplashState.success():
        _tag = _SplashStateTag.success;

  T map<T>({
    required T Function(_SplashStateInit v) init,
    required T Function(_SplashStateSuccess v) success,
  }) {
    switch (_tag) {
      case _SplashStateTag.init:
        return init(const _SplashStateInit());
      case _SplashStateTag.success:
        return success(const _SplashStateSuccess());
    }
  }

  T maybeMap<T>({
    T Function(_SplashStateInit v)? init,
    T Function(_SplashStateSuccess v)? success,
      required T Function() orElse,
  }) {
    switch (_tag) {
      case _SplashStateTag.init:
        if(init != null) return init(const _SplashStateInit());
        return orElse();
      case _SplashStateTag.success:
        if(success != null) return success(const _SplashStateSuccess());
        return orElse();
    }
  }

  T when<T>({
    required T Function () init,
    required T Function () success,
}) {
    switch (_tag) {
      case _SplashStateTag.init:
        return init();
      case _SplashStateTag.success:
        return success();
    }
  }

  @override
  bool operator ==(dynamic other) {
    switch (_tag) {

      case _SplashStateTag.init:
        return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SplashState ); 

      case _SplashStateTag.success:
        return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SplashState ); 
  
  }
}
  @override
  int get hashCode {
    switch (_tag) {

      case _SplashStateTag.init:
        return Object.hashAll([runtimeType]);
      case _SplashStateTag.success:
        return Object.hashAll([runtimeType]);  
  }
}
  @override
  String toString() {
    switch (_tag) {

      case _SplashStateTag.init:
        return 'SplashState.init()';
      case _SplashStateTag.success:
        return 'SplashState.success()';  
  }
}
  final _SplashStateTag _tag;

}

enum _SplashStateTag {
  init,
  success,
}
@immutable
class _SplashStateInit extends SplashState {
  const _SplashStateInit() : super.init();
}
@immutable
class _SplashStateSuccess extends SplashState {
  const _SplashStateSuccess() : super.success();
}
