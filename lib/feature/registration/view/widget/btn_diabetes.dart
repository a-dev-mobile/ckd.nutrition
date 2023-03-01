// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition/core/widget/widget.dart';
import 'package:nutrition/feature/registration/registration.dart';
import 'package:nutrition/feature/widgets/widgets.dart';
import 'package:nutrition/localization/localization.dart';

class BtnDiabetes extends StatelessWidget {
  const BtnDiabetes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cubit = context.watch<DiabetesCubit>();
    final state = cubit.state;
    final valid = state.validDiabetes;

    return AppCard(
      child: BtnToggleText(
        textList: [l.yes_caps, l.no_caps],
        isSelected: state.diabetesSelected,
        onPressed: (v) => cubit.checkDiabetes(v: v),
               onPressedAbout: cubit.goAboutDiabetes,
        errorText: valid.errorText(l: l),
        title: 'Наличие диабета',
      ),
    );
  }
}
