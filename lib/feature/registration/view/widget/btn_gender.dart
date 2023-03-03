// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition/core/widget/widget.dart';

import 'package:nutrition/feature/registration/registration.dart';
import 'package:nutrition/feature/widgets/widgets.dart';
import 'package:nutrition/localization/localization.dart';

class BtnGender extends StatelessWidget {
  const BtnGender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cubit = context.watch<GenderCubit>();
    final state = cubit.state;
    final valid = state.validGender;

    return MultiBlocListener(
      listeners: [
        BlocListener<GenderCubit, GenderState>(
          listener: (context, state) => _checkCreatinine(state, context),
        ),
       BlocListener<GenderCubit, GenderState>(
          listener: (context, state) {
 
          },
        ),
      ],
      child: AppCard(
        child: BtnToggleText(
          textList: [l.female, l.male],
          isSelected: state.genderSelected,
          onPressed: cubit.checkGender,
          onPressedAbout: cubit.goAboutGender,
          errorText: valid.errorText(l: l),
          title: 'Для человека какого пола следует рассчитывать рекомендации?',
        ),
      ),
    );
  }

  void _checkCreatinine(GenderState state, BuildContext context) {
    if (state.isValid) {
      context.read<CkdCubit>().checkCreatinine(
            isValidGender: state.isValid,
            isValidBirthday:
                context.read<BrithdayCubit>().state.validBirthday.isValid,
          );
    }
  }
}
