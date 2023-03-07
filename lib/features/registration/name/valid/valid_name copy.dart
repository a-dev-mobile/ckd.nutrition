// // ignore_for_file: avoid-nested-conditional-expressions

// import 'package:nutrition/core/valid/valid.dart';


// class ValidName extends FormzInput<String, ValidNameError> {
//   const ValidName.pure([this.externalError]) : super.pure('');

//   const ValidName.dirty(String value, this.externalError)
//       : super.dirty(value, externalError);
//   @override
//   final ValidNameError? externalError;


  
//   @override
//   ValidNameError? validator(String value) {
//     return value.isEmpty
//         ? ValidNameError.isEmpty
//         : RegExp(r'^.{30,100}$').hasMatch(value)
//             ? ValidNameError.maxLenght
//             : null;
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'ValidNameFormz': value,
//     };
//   }

//   factory ValidName.fromMap(Map<String, dynamic> map) {
//     final result = (map['ValidNameFormz'] as String?) ?? '';
//     if (result.isEmpty) return const ValidName.pure();

//     return ValidName.dirty(result);
//   }
// }

// extension ValidNameExtension on ValidName {
//   ValidNameError get isEmpty => ValidNameError.isEmpty;
//   ValidNameError get maxLength => ValidNameError.maxLenght;
// }

// enum ValidNameError { isEmpty, maxLenght }
