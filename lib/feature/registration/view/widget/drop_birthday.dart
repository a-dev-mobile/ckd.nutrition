import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition/core/widget/widget.dart';
import 'package:nutrition/feature/registration/registration.dart';
import 'package:nutrition/feature/widgets/widgets.dart';
import 'package:nutrition/localization/localization.dart';

class DropBirthday extends StatelessWidget {
  const DropBirthday({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cubit = context.watch<BrithdayCubit>();
    final state = cubit.state;
    final valid = state.validBirthday;

    return BlocListener<BrithdayCubit, BrithdayState>(
      listener: (context, state) =>_checkCreatinine(state, context),
      child: AppCard(
        child: Column(
          children: [
            const TitleSub(text: 'Укажите дату своего рождения'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppDropDown(
                  hint: 'ДЕНЬ',
                  value: state.daySelected,
                  onChanged: cubit.changeDay,
                  values: state.dateRegModel.days,
                ),
                _DropDownMonth(
                  hint: 'MЕСЯЦ',
                  onChanged: cubit.changeMonth,
                  value: state.monthSelected,
                  values: state.dateRegModel.months,
                ),
                AppDropDown(
                  hint: 'ГОД',
                  onChanged: cubit.changeYear,
                  value: state.yearSelected,
                  values: state.dateRegModel.years,
                ),
              ],
            ),
            ErrorMsg(error: valid.errorText(l: l)),
          ],
        ),
      ),
    );
  }

  void _checkCreatinine(BrithdayState state, BuildContext context) {
    if (state.isValid) {
      context.read<CkdCubit>().checkCreatinine(
            isValidGender:
                context.read<GenderCubit>().state.isValid,
            isValidBirthday: state.isValid,
          );
    }
  }
}

class _DropDownMonth extends StatelessWidget {
  const _DropDownMonth({
    required this.values,
    required this.hint,
    required this.onChanged,
    this.value,
  });
  final List<String> values;
  final String hint;
  final String? value;
  final void Function(String?) onChanged;
  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    return DropdownButton<String>(
      hint: Text(hint),
      value: value,
      items: [
        for (var v in values)
          DropdownMenuItem(
            value: v,
            child: Text(_getMonthName(l: l, monthNumber: v)),
          ),
      ],
      onChanged: onChanged,
    );
  }

  String _getMonthName({
    required String monthNumber,
    required AppLocalizations l,
  }) {
    final mapMonth = {
      '01': l.month_january,
      '02': l.month_february,
      '03': l.month_march,
      '04': l.month_april,
      '05': l.month_may,
      '06': l.month_june,
      '07': l.month_july,
      '08': l.month_august,
      '09': l.month_september,
      '10': l.month_october,
      '11': l.month_november,
      '12': l.month_december,
    };

    return mapMonth[monthNumber] ?? '';
  }
}
