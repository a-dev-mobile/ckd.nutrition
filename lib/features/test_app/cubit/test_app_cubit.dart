// // ignore_for_file: sort_constructors_first

// import 'dart:convert';

// import 'package:bloc/bloc.dart';
// import 'package:collection/collection.dart';
// import 'package:flutter/foundation.dart';
// import 'package:meta/meta.dart';

// class TestAppCubit extends Cubit<TestAppState> {
//   TestAppCubit() : super(const TestAppState());

//   Future<void> loadNameNutrient() async {
//     emit(state.copyWith(isLoad: true));
//   }
// }

// @immutable
// class TestAppState {
//   /* init: true */
//   final bool isLoad;
//   /* init: const [] */
//   final List<String> nameNutrient;
// // end

//   //  ******************************
//   // GENERATED CODE BELOW - DO NOT MODIFY
//   //  ******************************

//   const TestAppState({
//     this.isLoad = true,
//     this.nameNutrient = const [],
//   });
//   /*

//    factory TestAppState.init() => TestAppState(
//       );
//   */

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'isLoad': isLoad,
//       'nameNutrient': nameNutrient,
//     };
//   }

//   factory TestAppState.fromMap(Map<String, dynamic> map) {
//     return TestAppState(
//       isLoad: map['isLoad'] as bool? ?? true,
//       nameNutrient: (map['nameNutrient'] as List<dynamic>?)
//               ?.map((e) => e as String)
//               .toList() ??
//           const [],
//     );
//   }

//   TestAppState copyWith({
//     bool? isLoad,
//     List<String>? nameNutrient,
//   }) {
//     return TestAppState(
//       isLoad: isLoad ?? this.isLoad,
//       nameNutrient: nameNutrient ?? this.nameNutrient,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory TestAppState.fromJson(String source) =>
//       TestAppState.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   bool operator ==(dynamic other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is TestAppState &&
//             (identical(other.isLoad, isLoad) || other.isLoad == isLoad) &&
//             const DeepCollectionEquality()
//                 .equals(other.nameNutrient, nameNutrient));
//   }

//   @override
//   int get hashCode => Object.hashAll([
//         runtimeType,
//         isLoad,
//         const DeepCollectionEquality().hash(nameNutrient),
//       ]);

//   @override
//   String toString() {
//     return 'TestAppState(isLoad: $isLoad, nameNutrient: $nameNutrient, )';
//   }
// }
