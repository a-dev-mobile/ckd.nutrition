

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition/core/widget/widget.dart';
import 'package:nutrition/feature/registration/registration.dart';
import 'package:nutrition/feature/widgets/widgets.dart';
import 'package:nutrition/localization/localization.dart';

class BtnDailyDiuresis extends StatelessWidget {
  const BtnDailyDiuresis({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cubit = context.watch<DiuresisCubit>();
    final state = cubit.state;
    final valid = state.validDailyDiuresis;

    final boolValues = state.dailyDiuresisSelected;

    return AppCard(
      child: Column(
        children: [
          BtnToggleText(
            textList: const [
              'Нормальный',
              'Отсутствует',
            ],
            isSelected: [boolValues.first, boolValues[1]],
            onPressed: cubit.checkDailyDiuresis,
            title: 'Укажите уровень суточного диуреза (обьем выделяемой мочи)',
            dialogText:
                'Суточный диурез – количество выделенной мочи за сутки (сумма показателей дневного и ночного диуреза), в норме составляет 1000-2000 мл для мужчин, 1000–1600 мл для женщин',
          ),
          BtnToggleText(
            textList: const [
              'Ввести значение',
            ],
            isSelected: [boolValues[2]],
            // 2 because they are separated by two options
            onPressed: (v) => cubit.checkDailyDiuresis(v + 2),
            errorText: valid.errorText(l: l),
          ),
        ],
      ),
    );
  }
}
