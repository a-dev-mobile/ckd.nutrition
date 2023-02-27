part of 'markdown_cubit.dart';

class _MarkdownState {
  const _MarkdownState.initial([String msg = 'init']);
  const _MarkdownState.error([String msg = 'error']);
  const _MarkdownState.load();
  const _MarkdownState.success({String text = 'success'});
}
// end

//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  
// coverage:ignore-file
// ignore_for_file: avoid_unused_constructor_parameters, unused_element, avoid-non-null-assertion,  library_private_types_in_public_api,non_constant_identifier_names, always_put_required_named_parameters_first,  avoid_positional_boolean_parameters, strict_raw_type
@immutable
class MarkdownState {
  const MarkdownState.initial([String msg = 'init']):
        _tag = _MarkdownStateTag.initial,
        _msg_initial = msg,
        _msg_error = null,
        _text_success = null;
  const MarkdownState.error([String msg = 'error']):
        _tag = _MarkdownStateTag.error,
        _msg_initial = null,
        _msg_error = msg,
        _text_success = null;
  const MarkdownState.load():
        _tag = _MarkdownStateTag.load,
        _msg_initial = null,
        _msg_error = null,
        _text_success = null;
  const MarkdownState.success({String text = 'success'}):
        _tag = _MarkdownStateTag.success,
        _msg_initial = null,
        _msg_error = null,
        _text_success = text;

  T? mapOrNull<T>({
    T? Function(_MarkdownStateInitial v)? initial,
    T? Function(_MarkdownStateError v)? error,
    T? Function(_MarkdownStateLoad v)? load,
    T? Function(_MarkdownStateSuccess v)? success,
  }) {
    switch (_tag) {
      case _MarkdownStateTag.initial:
        return initial?.call(_MarkdownStateInitial(_msg_initial!));
      case _MarkdownStateTag.error:
        return error?.call(_MarkdownStateError(_msg_error!));
      case _MarkdownStateTag.load:
        return load?.call(const _MarkdownStateLoad());
      case _MarkdownStateTag.success:
        return success?.call(_MarkdownStateSuccess(_text_success!));
    }
  }

  T map<T>({
    required T Function(_MarkdownStateInitial v) initial,
    required T Function(_MarkdownStateError v) error,
    required T Function(_MarkdownStateLoad v) load,
    required T Function(_MarkdownStateSuccess v) success,
  }) {
    switch (_tag) {
      case _MarkdownStateTag.initial:
        return initial(_MarkdownStateInitial(_msg_initial!));
      case _MarkdownStateTag.error:
        return error(_MarkdownStateError(_msg_error!));
      case _MarkdownStateTag.load:
        return load(const _MarkdownStateLoad());
      case _MarkdownStateTag.success:
        return success(_MarkdownStateSuccess(_text_success!));
    }
  }

  T maybeMap<T>({
    T Function(_MarkdownStateInitial v)? initial,
    T Function(_MarkdownStateError v)? error,
    T Function(_MarkdownStateLoad v)? load,
    T Function(_MarkdownStateSuccess v)? success,
      required T Function() orElse,
  }) {
    switch (_tag) {
      case _MarkdownStateTag.initial:
        if(initial != null) return initial(_MarkdownStateInitial(_msg_initial!));
        return orElse();
      case _MarkdownStateTag.error:
        if(error != null) return error(_MarkdownStateError(_msg_error!));
        return orElse();
      case _MarkdownStateTag.load:
        if(load != null) return load(const _MarkdownStateLoad());
        return orElse();
      case _MarkdownStateTag.success:
        if(success != null) return success(_MarkdownStateSuccess(_text_success!));
        return orElse();
    }
  }

  T when<T>({
    required T Function (String msg) initial,
    required T Function (String msg) error,
    required T Function () load,
    required T Function (String text) success,
}) {
    switch (_tag) {
      case _MarkdownStateTag.initial:
        return initial(_msg_initial!);
      case _MarkdownStateTag.error:
        return error(_msg_error!);
      case _MarkdownStateTag.load:
        return load();
      case _MarkdownStateTag.success:
        return success(_text_success!);
    }
  }

  @override
  bool operator ==(dynamic other) {
    switch (_tag) {

      case _MarkdownStateTag.initial:
        return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MarkdownState  &&  
 (identical(other._msg_initial, _msg_initial) || other._msg_initial == _msg_initial)); 
      case _MarkdownStateTag.error:
        return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MarkdownState  &&  
 (identical(other._msg_error, _msg_error) || other._msg_error == _msg_error)); 
      case _MarkdownStateTag.load:
        return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MarkdownState ); 

      case _MarkdownStateTag.success:
        return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MarkdownState  &&  
 (identical(other._text_success, _text_success) || other._text_success == _text_success));   
  }
}
  @override
  int get hashCode {
    switch (_tag) {

      case _MarkdownStateTag.initial:
        return Object.hashAll([runtimeType, _msg_initial]);
      case _MarkdownStateTag.error:
        return Object.hashAll([runtimeType, _msg_error]);
      case _MarkdownStateTag.load:
        return Object.hashAll([runtimeType]);
      case _MarkdownStateTag.success:
        return Object.hashAll([runtimeType, _text_success]);  
  }
}
  @override
  String toString() {
    switch (_tag) {

      case _MarkdownStateTag.initial:
        return 'MarkdownState.initial(msg: $_msg_initial)';
      case _MarkdownStateTag.error:
        return 'MarkdownState.error(msg: $_msg_error)';
      case _MarkdownStateTag.load:
        return 'MarkdownState.load()';
      case _MarkdownStateTag.success:
        return 'MarkdownState.success(text: $_text_success)';  
  }
}
  final _MarkdownStateTag _tag;
  final String? _msg_initial;
  final String? _msg_error;
  final String? _text_success;

}

enum _MarkdownStateTag {
  initial,
  error,
  load,
  success,
}
@immutable
class _MarkdownStateInitial extends MarkdownState {
  const _MarkdownStateInitial(this.msg) : super.initial( msg);
  final String msg;
}
@immutable
class _MarkdownStateError extends MarkdownState {
  const _MarkdownStateError(this.msg) : super.error( msg);
  final String msg;
}
@immutable
class _MarkdownStateLoad extends MarkdownState {
  const _MarkdownStateLoad() : super.load();
}
@immutable
class _MarkdownStateSuccess extends MarkdownState {
  const _MarkdownStateSuccess(this.text) : super.success(text: text);
  final String text;
}
