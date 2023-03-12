part of 'splash_provider.dart';

class _SplashState {
  const _SplashState.load();
  const _SplashState.success();
}

// end

//          --TURN_GEN--
//             v0.4.1
//  *************************************
//           GENERATED CODE
//  *************************************

// coverage:ignore-file
// ignore_for_file: avoid_unused_constructor_parameters, unused_element, avoid-non-null-assertion,  library_private_types_in_public_api,non_constant_identifier_names, always_put_required_named_parameters_first,  avoid_positional_boolean_parameters, strict_raw_type, curly_braces_in_flow_control_structures
@immutable
class SplashState {
  const SplashState.load() : _tag = _SplashStateTag.load;

  const SplashState.success() : _tag = _SplashStateTag.success;

  T? mapOrNull<T>({
    T? Function(_SplashStateLoad v)? load,
    T? Function(_SplashStateSuccess v)? success,
  }) {
    switch (_tag) {
      case _SplashStateTag.load:
        return load?.call(const _SplashStateLoad());
      case _SplashStateTag.success:
        return success?.call(const _SplashStateSuccess());
    }
  }

  T map<T>({
    required T Function(_SplashStateLoad v) load,
    required T Function(_SplashStateSuccess v) success,
  }) {
    switch (_tag) {
      case _SplashStateTag.load:
        return load(const _SplashStateLoad());
      case _SplashStateTag.success:
        return success(const _SplashStateSuccess());
    }
  }

  T maybeMap<T>({
    T Function(_SplashStateLoad v)? load,
    T Function(_SplashStateSuccess v)? success,
    required T Function() orElse,
  }) {
    switch (_tag) {
      case _SplashStateTag.load:
        if (load != null) return load(const _SplashStateLoad());
        return orElse();
      case _SplashStateTag.success:
        if (success != null) return success(const _SplashStateSuccess());
        return orElse();
    }
  }

  T when<T>({
    required T Function() load,
    required T Function() success,
  }) {
    switch (_tag) {
      case _SplashStateTag.load:
        return load();
      case _SplashStateTag.success:
        return success();
    }
  }

  @override
  bool operator ==(dynamic other) {
    switch (_tag) {
      case _SplashStateTag.load:
        return identical(this, other) ||
            (other.runtimeType == runtimeType && other is SplashState);

      case _SplashStateTag.success:
        return identical(this, other) ||
            (other.runtimeType == runtimeType && other is SplashState);
    }
  }

  @override
  int get hashCode {
    switch (_tag) {
      case _SplashStateTag.load:
        return Object.hashAll([runtimeType]);
      case _SplashStateTag.success:
        return Object.hashAll([runtimeType]);
    }
  }

  @override
  String toString() {
    switch (_tag) {
      case _SplashStateTag.load:
        return 'SplashState.load()';
      case _SplashStateTag.success:
        return 'SplashState.success()';
    }
  }

  final _SplashStateTag _tag;
}

enum _SplashStateTag {
  load,
  success,
}

@immutable
class _SplashStateLoad extends SplashState {
  const _SplashStateLoad() : super.load();
}

@immutable
class _SplashStateSuccess extends SplashState {
  const _SplashStateSuccess() : super.success();
}
