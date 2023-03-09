import 'package:meta/meta.dart';

class _OnboardingState {
  const _OnboardingState.init();
}
// end

//          --TURN_GEN--
//  *************************************
//           GENERATED CODE
//  *************************************

// coverage:ignore-file
// ignore_for_file: avoid_unused_constructor_parameters, unused_element, avoid-non-null-assertion,  library_private_types_in_public_api,non_constant_identifier_names, always_put_required_named_parameters_first,  avoid_positional_boolean_parameters, strict_raw_type, curly_braces_in_flow_control_structures
@immutable
class OnboardingState {
  // ignore: avoid_field_initializers_in_const_classes
  const OnboardingState.init() : _tag = _OnboardingStateTag.init;

  T? mapOrNull<T>({
    T? Function(_OnboardingStateInit v)? init,
  }) {
    switch (_tag) {
      case _OnboardingStateTag.init:
        return init?.call(const _OnboardingStateInit());
    }
  }

  T map<T>({
    required T Function(_OnboardingStateInit v) init,
  }) {
    switch (_tag) {
      case _OnboardingStateTag.init:
        return init(const _OnboardingStateInit());
    }
  }

  T maybeMap<T>({
    T Function(_OnboardingStateInit v)? init,
    required T Function() orElse,
  }) {
    switch (_tag) {
      case _OnboardingStateTag.init:
        if (init != null) return init(const _OnboardingStateInit());
        return orElse();
    }
  }

  T when<T>({
    required T Function() init,
  }) {
    switch (_tag) {
      case _OnboardingStateTag.init:
        return init();
    }
  }

  @override
  bool operator ==(dynamic other) {
    switch (_tag) {
      case _OnboardingStateTag.init:
        return identical(this, other) ||
            (other.runtimeType == runtimeType && other is OnboardingState);
    }
  }

  @override
  int get hashCode {
    switch (_tag) {
      case _OnboardingStateTag.init:
        return Object.hashAll([runtimeType]);
    }
  }

  @override
  String toString() {
    switch (_tag) {
      case _OnboardingStateTag.init:
        return 'OnboardingState.init()';
    }
  }

  final _OnboardingStateTag _tag;
}

enum _OnboardingStateTag {
  init,
}

@immutable
class _OnboardingStateInit extends OnboardingState {
  const _OnboardingStateInit() : super.init();
}
