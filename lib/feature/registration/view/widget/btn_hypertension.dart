// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition/core/widget/widget.dart';
import 'package:nutrition/feature/registration/registration.dart';

import 'package:nutrition/feature/widgets/widgets.dart';
import 'package:nutrition/localization/localization.dart';

class BtnHypertension extends StatelessWidget {
  const BtnHypertension({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    final cubit = context.watch<HypertensionCubit>();
    final state = cubit.state;
    final valid = state.validHypertension;

    return AppCard(
      child: BtnToggleText(
        textList: [l.yes_caps, l.no_caps],
        isSelected: state.hypertensionSelected,
        onPressed: (v) => cubit.checkHypertension(v: v),
        onPressedAbout: cubit.goAboutHypertension,
        errorText: valid.errorText(l: l),
        title: 'Наличие гипертензии (высокое кровяное давление)',
      ),
    );
  }
}
