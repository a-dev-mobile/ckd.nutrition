import 'package:flutter/material.dart';

/* no: tojson fromJson */
@immutable
class _ConnectivityState {
  const _ConnectivityState.isDisonnected();
  const _ConnectivityState.isConnected();
  const _ConnectivityState.notDetermined();
}
// end

//          --TURN_GEN--
//  *************************************
//           GENERATED CODE
//  *************************************

// coverage:ignore-file
// ignore_for_file: avoid_unused_constructor_parameters, unused_element, avoid-non-null-assertion,  library_private_types_in_public_api,non_constant_identifier_names, always_put_required_named_parameters_first,  avoid_positional_boolean_parameters, strict_raw_type, curly_braces_in_flow_control_structures
@immutable
class ConnectivityState {
  const ConnectivityState.isDisonnected()
      : _tag = _ConnectivityStateTag.isDisonnected;
  const ConnectivityState.isConnected()
      : _tag = _ConnectivityStateTag.isConnected;
  const ConnectivityState.notDetermined()
      : _tag = _ConnectivityStateTag.notDetermined;

  T? mapOrNull<T>({
    T? Function(_ConnectivityStateIsdisonnected v)? isDisonnected,
    T? Function(_ConnectivityStateIsconnected v)? isConnected,
    T? Function(_ConnectivityStateNotdetermined v)? notDetermined,
  }) {
    switch (_tag) {
      case _ConnectivityStateTag.isDisonnected:
        return isDisonnected?.call(const _ConnectivityStateIsdisonnected());
      case _ConnectivityStateTag.isConnected:
        return isConnected?.call(const _ConnectivityStateIsconnected());
      case _ConnectivityStateTag.notDetermined:
        return notDetermined?.call(const _ConnectivityStateNotdetermined());
    }
  }

  T map<T>({
    required T Function(_ConnectivityStateIsdisonnected v) isDisonnected,
    required T Function(_ConnectivityStateIsconnected v) isConnected,
    required T Function(_ConnectivityStateNotdetermined v) notDetermined,
  }) {
    switch (_tag) {
      case _ConnectivityStateTag.isDisonnected:
        return isDisonnected(const _ConnectivityStateIsdisonnected());
      case _ConnectivityStateTag.isConnected:
        return isConnected(const _ConnectivityStateIsconnected());
      case _ConnectivityStateTag.notDetermined:
        return notDetermined(const _ConnectivityStateNotdetermined());
    }
  }

  T maybeMap<T>({
    T Function(_ConnectivityStateIsdisonnected v)? isDisonnected,
    T Function(_ConnectivityStateIsconnected v)? isConnected,
    T Function(_ConnectivityStateNotdetermined v)? notDetermined,
    required T Function() orElse,
  }) {
    switch (_tag) {
      case _ConnectivityStateTag.isDisonnected:
        if (isDisonnected != null)
          return isDisonnected(const _ConnectivityStateIsdisonnected());
        return orElse();
      case _ConnectivityStateTag.isConnected:
        if (isConnected != null)
          return isConnected(const _ConnectivityStateIsconnected());
        return orElse();
      case _ConnectivityStateTag.notDetermined:
        if (notDetermined != null)
          return notDetermined(const _ConnectivityStateNotdetermined());
        return orElse();
    }
  }

  T when<T>({
    required T Function() isDisonnected,
    required T Function() isConnected,
    required T Function() notDetermined,
  }) {
    switch (_tag) {
      case _ConnectivityStateTag.isDisonnected:
        return isDisonnected();
      case _ConnectivityStateTag.isConnected:
        return isConnected();
      case _ConnectivityStateTag.notDetermined:
        return notDetermined();
    }
  }

  @override
  bool operator ==(dynamic other) {
    switch (_tag) {
      case _ConnectivityStateTag.isDisonnected:
        return identical(this, other) ||
            (other.runtimeType == runtimeType && other is ConnectivityState);

      case _ConnectivityStateTag.isConnected:
        return identical(this, other) ||
            (other.runtimeType == runtimeType && other is ConnectivityState);

      case _ConnectivityStateTag.notDetermined:
        return identical(this, other) ||
            (other.runtimeType == runtimeType && other is ConnectivityState);
    }
  }

  @override
  int get hashCode {
    switch (_tag) {
      case _ConnectivityStateTag.isDisonnected:
        return Object.hashAll([runtimeType]);
      case _ConnectivityStateTag.isConnected:
        return Object.hashAll([runtimeType]);
      case _ConnectivityStateTag.notDetermined:
        return Object.hashAll([runtimeType]);
    }
  }

  @override
  String toString() {
    switch (_tag) {
      case _ConnectivityStateTag.isDisonnected:
        return 'ConnectivityState.isDisonnected()';
      case _ConnectivityStateTag.isConnected:
        return 'ConnectivityState.isConnected()';
      case _ConnectivityStateTag.notDetermined:
        return 'ConnectivityState.notDetermined()';
    }
  }

  final _ConnectivityStateTag _tag;
}

enum _ConnectivityStateTag {
  isDisonnected,
  isConnected,
  notDetermined,
}

@immutable
class _ConnectivityStateIsdisonnected extends ConnectivityState {
  const _ConnectivityStateIsdisonnected() : super.isDisonnected();
}

@immutable
class _ConnectivityStateIsconnected extends ConnectivityState {
  const _ConnectivityStateIsconnected() : super.isConnected();
}

@immutable
class _ConnectivityStateNotdetermined extends ConnectivityState {
  const _ConnectivityStateNotdetermined() : super.notDetermined();
}
