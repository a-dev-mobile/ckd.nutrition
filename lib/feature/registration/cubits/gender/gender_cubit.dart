import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nutrition/core/storage/storage.dart';

import 'package:nutrition/core/valid/valid.dart';
import 'package:nutrition/feature/markdown/markdown.dart';
import 'package:nutrition/feature/registration/registration.dart';
import 'package:nutrition/navigation/navigation.dart';

part 'gender_state.dart';

class GenderCubit extends HydratedCubit<GenderState> {
  GenderCubit({
    required AppRouter router,
    required AppStorage storage,
  })  : _go = router,
        _storage = storage,
        super(
          GenderState(
            genderSelected:
                List<bool>.filled(EnumGender.values.length - 1, false),
          ),
        );

  final AppRouter _go;

  final AppStorage _storage;

  void checkGender(int value) {
    final gender = EnumGender.values[value];

    final validGender = ValidGender.dirty(gender);

    final genderSelected = gender.map(
      male: () => [false, true],
      female: () => [true, false],
      none: () => [false, false],
    );

    checkValid(validGender: validGender);

    emit(
      state.copyWith(
        genderSelected: genderSelected,
      ),
    );
  }

  void checkValid({ValidGender? validGender}) {
    validGender ??= ValidGender.dirty(state.validGender.value);

    emit(
      state.copyWith(
        validGender: validGender,
        isValid: Formz.validate([validGender]),
      ),
    );
  }

  Future<void> goAboutGender() async {
    const ru =
        'https://drive.google.com/uc?export=view&id=1Cl4YeeTYMFPIaz5NL1A29zF6jS6pgKpo';
    const en =
        'https://drive.google.com/uc?export=view&id=1Dj2pK8TetkIqxLQp_J8lLGspaEMpeJgB';

    await _storage.setMarkdownModel(const MarkdownModel(urlEN: en, urlRU: ru));
    _go.router.pushNamed(MarkdownPage.name);
  }

  @override
  GenderState? fromJson(Map<String, dynamic> json) {
    return GenderState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(GenderState state) {
    return state.toMap();
  }
}
