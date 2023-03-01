// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition/core/widget/widget.dart';
import 'package:nutrition/feature/registration/registration.dart';
import 'package:nutrition/feature/widgets/widgets.dart';
import 'package:nutrition/localization/localization.dart';

class BtnCkd extends StatelessWidget {
  const BtnCkd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cubit = context.watch<CkdCubit>();
    final booles = cubit.state.ckdSelected;
    final valid = cubit.state.validCkd;

    return AppCard(
      child: Column(
        children: [
          BtnToggleText(
            textList: const ['1', '2', '3a', '3b', '4', '5'],
            isSelected: booles.sublist(0, booles.length - 1),
            onPressed: cubit.checkCkd,
            title: 'Укажите стадию ХБП',
              onPressedAbout: cubit.goAbouCkd,
         
          ),
          BtnToggleText(
            textList: const ['Определить'],
            isSelected: booles.sublist(booles.length - 1, booles.length),
            // ignore: prefer-extracting-callbacks
            onPressed: (v) {
              cubit.checkCkd(v + booles.length - 1);
            },
            errorText: valid.errorText(l: l),
          ),
        ],
      ),
    );
  }
}
