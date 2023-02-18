import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nutrition/feature/registration/registration.dart';

import 'package:nutrition/localization/localization.dart';

class DropInputTypeCreatinine extends StatelessWidget {
  const DropInputTypeCreatinine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegistrationCubit>();

    final l = context.l10n;

    return BlocBuilder<RegistrationCubit, RegistrationState>(
      buildWhen: (p, c) => p.inputTypeCreatinine != c.inputTypeCreatinine,
      builder: (context, state) {
        return Row(
          children: [
            const Expanded(child: Text('Выберите единицу измерения')),
            DropdownButton<EnumInputTypeCreatinine>(
              value: state.inputTypeCreatinine,
              items: [
                for (var v in EnumInputTypeCreatinine.values)
                  DropdownMenuItem(
                    value: v,
                    child: Text(_getText(type: v, l: l)),
                  ),
              ],
              onChanged: cubit.changeTypeCreatinine,

              /* 

                  EnumInputTypeCreatinine.values
                    .map(
                      (e) => DropdownMenuItem<EnumInputTypeCreatinine>(
                        child: Text(_getText(type: e, l: l)),
                      ),
                    )
                    .toList()
                     */
            ),
          ],
        );
      },
    );
  }
}

String _getText({
  required EnumInputTypeCreatinine type,
  required AppLocalizations l,
}) {
  return type.map(
    mgDl: () => l.mgDl,
    mmmolL: () => l.mmmolL,
    mcmolL: () => l.mcmolL,
  );
}
