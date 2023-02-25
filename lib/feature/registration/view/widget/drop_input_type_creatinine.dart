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
    final cubit = context.watch<CkdCubit>();

    final l = context.l10n;



    return Row(
          children: [
            const Expanded(child: Text('Выберите единицу измерения')),
            const SizedBox(width: 10),
            DropdownButton<EnumInputTypeCreatinine>(
              value: cubit.state.inputTypeCreatinine,
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
  }
}

String _getText({
  required EnumInputTypeCreatinine type,
  required AppLocalizations l,
}) {
  return type.map(
    mgDl: () => l.mgDl,
    mcmolL: () => l.mcmolL,
  );
}
