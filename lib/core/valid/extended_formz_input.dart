// part of 'formz.dart';

// abstract class ExtendedFormzInput<T, E> extends FormzInput<T, E> {

//   const ExtendedFormzInput.dirty(T value, this.externalError)
//       : super.dirty(value);

//   const ExtendedFormzInput.pure(T value)
//       : externalError = null,
//         super.pure(value);
//   final E externalError;

//   ExtendedFormzInput copyWithExternalError(E error);

//   @override
//   E get error => externalError ?? super.error;

//   @override
//   bool get valid => error == null;

//   @override
//   int get hashCode => value.hashCode ^ pure.hashCode ^ externalError.hashCode;

//   @override
//   bool operator ==(Object other) {
//     if (other.runtimeType != runtimeType) return false;

//     return other is ExtendedFormzInput<T, E> &&
//         other.value == value &&
//         other.externalError == externalError &&
//         other.pure == pure;
//   }
// }
