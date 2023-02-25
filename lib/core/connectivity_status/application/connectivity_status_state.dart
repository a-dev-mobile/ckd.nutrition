// ignore_for_file: sort_constructors_first

import 'package:flutter/material.dart';

/* no: tojson fromJson */
@immutable
class _ConnectivityStatusState {
  const _ConnectivityStatusState.isDisonnected();
  const _ConnectivityStatusState.isConnected();
  const _ConnectivityStatusState.notDetermined();
}
// end

//          --TURN_GEN--
//  *************************************
//           GENERATED CODE
//  *************************************

// coverage:ignore-file
// ignore_for_file: avoid_unused_constructor_parameters, unused_element, avoid-non-null-assertion,  library_private_types_in_public_api,non_constant_identifier_names, always_put_required_named_parameters_first,  avoid_positional_boolean_parameters, strict_raw_type
@immutable
class ConnectivityStatusState {
  const ConnectivityStatusState.isDisonnected()
      : _tag = _ConnectivityStatusStateTag.isDisonnected;
  const ConnectivityStatusState.isConnected()
      : _tag = _ConnectivityStatusStateTag.isConnected;
  const ConnectivityStatusState.notDetermined()
      : _tag = _ConnectivityStatusStateTag.notDetermined;

  T map<T>({
    required T Function(_ConnectivityStatusStateIsdisonnected v) isDisonnected,
    required T Function(_ConnectivityStatusStateIsconnected v) isConnected,
    required T Function(_ConnectivityStatusStateNotdetermined v) notDetermined,
  }) {
    switch (_tag) {
      case _ConnectivityStatusStateTag.isDisonnected:
        return isDisonnected(const _ConnectivityStatusStateIsdisonnected());
      case _ConnectivityStatusStateTag.isConnected:
        return isConnected(const _ConnectivityStatusStateIsconnected());
      case _ConnectivityStatusStateTag.notDetermined:
        return notDetermined(const _ConnectivityStatusStateNotdetermined());
    }
  }

  T maybeMap<T>({
    T Function(_ConnectivityStatusStateIsdisonnected v)? isDisonnected,
    T Function(_ConnectivityStatusStateIsconnected v)? isConnected,
    T Function(_ConnectivityStatusStateNotdetermined v)? notDetermined,
    required T Function() orElse,
  }) {
    switch (_tag) {
      case _ConnectivityStatusStateTag.isDisonnected:
        if (isDisonnected != null)
          return isDisonnected(const _ConnectivityStatusStateIsdisonnected());
        return orElse();
      case _ConnectivityStatusStateTag.isConnected:
        if (isConnected != null)
          return isConnected(const _ConnectivityStatusStateIsconnected());
        return orElse();
      case _ConnectivityStatusStateTag.notDetermined:
        if (notDetermined != null)
          return notDetermined(const _ConnectivityStatusStateNotdetermined());
        return orElse();
    }
  }

  T when<T>({
    required T Function() isDisonnected,
    required T Function() isConnected,
    required T Function() notDetermined,
  }) {
    switch (_tag) {
      case _ConnectivityStatusStateTag.isDisonnected:
        return isDisonnected();
      case _ConnectivityStatusStateTag.isConnected:
        return isConnected();
      case _ConnectivityStatusStateTag.notDetermined:
        return notDetermined();
    }
  }

  @override
  bool operator ==(dynamic other) {
    switch (_tag) {
      case _ConnectivityStatusStateTag.isDisonnected:
        return identical(this, other) ||
            (other.runtimeType == runtimeType &&
                other is ConnectivityStatusState);

      case _ConnectivityStatusStateTag.isConnected:
        return identical(this, other) ||
            (other.runtimeType == runtimeType &&
                other is ConnectivityStatusState);

      case _ConnectivityStatusStateTag.notDetermined:
        return identical(this, other) ||
            (other.runtimeType == runtimeType &&
                other is ConnectivityStatusState);
    }
  }

  @override
  int get hashCode {
    switch (_tag) {
      case _ConnectivityStatusStateTag.isDisonnected:
        return Object.hashAll([runtimeType]);
      case _ConnectivityStatusStateTag.isConnected:
        return Object.hashAll([runtimeType]);
      case _ConnectivityStatusStateTag.notDetermined:
        return Object.hashAll([runtimeType]);
    }
  }

  @override
  String toString() {
    switch (_tag) {
      case _ConnectivityStatusStateTag.isDisonnected:
        return 'ConnectivityStatusState.isDisonnected()';
      case _ConnectivityStatusStateTag.isConnected:
        return 'ConnectivityStatusState.isConnected()';
      case _ConnectivityStatusStateTag.notDetermined:
        return 'ConnectivityStatusState.notDetermined()';
    }
  }

  final _ConnectivityStatusStateTag _tag;
}

enum _ConnectivityStatusStateTag {
  isDisonnected,
  isConnected,
  notDetermined,
}

@immutable
class _ConnectivityStatusStateIsdisonnected extends ConnectivityStatusState {
  const _ConnectivityStatusStateIsdisonnected() : super.isDisonnected();
}

@immutable
class _ConnectivityStatusStateIsconnected extends ConnectivityStatusState {
  const _ConnectivityStatusStateIsconnected() : super.isConnected();
}

@immutable
class _ConnectivityStatusStateNotdetermined extends ConnectivityStatusState {
  const _ConnectivityStatusStateNotdetermined() : super.notDetermined();
}
