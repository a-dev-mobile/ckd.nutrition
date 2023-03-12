import 'package:meta/meta.dart';

/// Represents all app failures
class _Failure implements Exception {
  /// Expected value is null or empty
  const _Failure.empty();

  /// Any status other than 200
  const _Failure.badRequest();

  ///  Expected value has invalid format
  const _Failure.unprocessableEntity();

  /// Get the error message for specified failure
  const _Failure.other();
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

/// Represents all app failures
class Failure implements Exception {
  /// Expected value is null or empty
  const Failure.empty() : _tag = _FailureTag.empty;

  /// Any status other than 200
  const Failure.badRequest() : _tag = _FailureTag.badRequest;

  ///  Expected value has invalid format
  const Failure.unprocessableEntity() : _tag = _FailureTag.unprocessableEntity;

  /// Get the error message for specified failure
  const Failure.other() : _tag = _FailureTag.other;

  T? mapOrNull<T>({
    T? Function(_FailureEmpty v)? empty,
    T? Function(_FailureBadrequest v)? badRequest,
    T? Function(_FailureUnprocessableentity v)? unprocessableEntity,
    T? Function(_FailureOther v)? other,
  }) {
    switch (_tag) {
      case _FailureTag.empty:
        return empty?.call(const _FailureEmpty());
      case _FailureTag.badRequest:
        return badRequest?.call(const _FailureBadrequest());
      case _FailureTag.unprocessableEntity:
        return unprocessableEntity?.call(const _FailureUnprocessableentity());
      case _FailureTag.other:
        return other?.call(const _FailureOther());
    }
  }

  T map<T>({
    required T Function(_FailureEmpty v) empty,
    required T Function(_FailureBadrequest v) badRequest,
    required T Function(_FailureUnprocessableentity v) unprocessableEntity,
    required T Function(_FailureOther v) other,
  }) {
    switch (_tag) {
      case _FailureTag.empty:
        return empty(const _FailureEmpty());
      case _FailureTag.badRequest:
        return badRequest(const _FailureBadrequest());
      case _FailureTag.unprocessableEntity:
        return unprocessableEntity(const _FailureUnprocessableentity());
      case _FailureTag.other:
        return other(const _FailureOther());
    }
  }

  T maybeMap<T>({
    T Function(_FailureEmpty v)? empty,
    T Function(_FailureBadrequest v)? badRequest,
    T Function(_FailureUnprocessableentity v)? unprocessableEntity,
    T Function(_FailureOther v)? other,
    required T Function() orElse,
  }) {
    switch (_tag) {
      case _FailureTag.empty:
        if (empty != null) return empty(const _FailureEmpty());
        return orElse();
      case _FailureTag.badRequest:
        if (badRequest != null) return badRequest(const _FailureBadrequest());
        return orElse();
      case _FailureTag.unprocessableEntity:
        if (unprocessableEntity != null)
          return unprocessableEntity(const _FailureUnprocessableentity());
        return orElse();
      case _FailureTag.other:
        if (other != null) return other(const _FailureOther());
        return orElse();
    }
  }

  T when<T>({
    required T Function() empty,
    required T Function() badRequest,
    required T Function() unprocessableEntity,
    required T Function() other,
  }) {
    switch (_tag) {
      case _FailureTag.empty:
        return empty();
      case _FailureTag.badRequest:
        return badRequest();
      case _FailureTag.unprocessableEntity:
        return unprocessableEntity();
      case _FailureTag.other:
        return other();
    }
  }

  @override
  bool operator ==(dynamic other) {
    switch (_tag) {
      case _FailureTag.empty:
        return identical(this, other) ||
            (other.runtimeType == runtimeType && other is Failure);

      case _FailureTag.badRequest:
        return identical(this, other) ||
            (other.runtimeType == runtimeType && other is Failure);

      case _FailureTag.unprocessableEntity:
        return identical(this, other) ||
            (other.runtimeType == runtimeType && other is Failure);

      case _FailureTag.other:
        return identical(this, other) ||
            (other.runtimeType == runtimeType && other is Failure);
    }
  }

  @override
  int get hashCode {
    switch (_tag) {
      case _FailureTag.empty:
        return Object.hashAll([runtimeType]);
      case _FailureTag.badRequest:
        return Object.hashAll([runtimeType]);
      case _FailureTag.unprocessableEntity:
        return Object.hashAll([runtimeType]);
      case _FailureTag.other:
        return Object.hashAll([runtimeType]);
    }
  }

  @override
  String toString() {
    switch (_tag) {
      case _FailureTag.empty:
        return 'Failure.empty()';
      case _FailureTag.badRequest:
        return 'Failure.badRequest()';
      case _FailureTag.unprocessableEntity:
        return 'Failure.unprocessableEntity()';
      case _FailureTag.other:
        return 'Failure.other()';
    }
  }

  final _FailureTag _tag;
}

enum _FailureTag {
  empty,
  badRequest,
  unprocessableEntity,
  other,
}

@immutable
class _FailureEmpty extends Failure {
  const _FailureEmpty() : super.empty();
}

@immutable
class _FailureBadrequest extends Failure {
  const _FailureBadrequest() : super.badRequest();
}

@immutable
class _FailureUnprocessableentity extends Failure {
  const _FailureUnprocessableentity() : super.unprocessableEntity();
}

@immutable
class _FailureOther extends Failure {
  const _FailureOther() : super.other();
}
