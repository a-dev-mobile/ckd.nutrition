// ignore_for_file:  avoid-nested-conditional-expressions, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition/core/utils/utils.dart';
import 'package:nutrition/feature/registration/registration.dart';
import 'package:nutrition/feature/widgets/widgets.dart';
import 'package:nutrition/localization/localization.dart';

class FieldUrineOutput extends StatefulWidget {
  const FieldUrineOutput({
    super.key,
  });

  @override
  State<FieldUrineOutput> createState() => _FieldUrineOutputState();
}

class _FieldUrineOutputState extends State<FieldUrineOutput> {
  late final TextEditingController controller;

  @override
  void initState() {
    var initValue = '';
    final initDouble =
        context.read<DiuresisCubit>().state.validUrineOutput.value;

    if (initDouble != null) {
      initValue = AppUtilsNumber.correctFormatDouble(initDouble);
    }
    controller = TextEditingController(text: initValue);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cubit = context.watch<DiuresisCubit>();
    final state = cubit.state;
    final valid = state.validUrineOutput;

    const errorMaxLines2 = 2;
    const maxLength = 6;

    return Visibility(
      visible: state.isVisibleUrineOutput,
      child: AppCard(
        child: Column(
          children: [
            const TitleSub(
              text: 'Укажите количество выделяемой мочи',
              dialogText:
                  'Мы используем эти сведения для расчета суточной нормы потребления воды',
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                // labelText: 'Моча',
                errorText: valid.errorText(l: l),
                errorMaxLines: errorMaxLines2,
                suffixText: 'мл',
              ),
              keyboardType: TextInputType.number,
              onChanged: cubit.checkUrineOutput,
              inputFormatters: [
                LengthLimitingTextInputFormatter(maxLength),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
