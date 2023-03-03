// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition/core/utils/app_utils.dart';
import 'package:nutrition/feature/registration/registration.dart';
import 'package:nutrition/feature/widgets/widgets.dart';
import 'package:nutrition/localization/localization.dart';

//  ignore_for_file: avoid-nested-conditional-expressions
class FieldWeight extends StatefulWidget {
  const FieldWeight({
    super.key,
  });

  @override
  State<FieldWeight> createState() => _FieldWeightState();
}

class _FieldWeightState extends State<FieldWeight> {
  late final TextEditingController controller;

  @override
  void initState() {
    var initValue = '';
    final initDouble = context.read<WeghtCubit>().state.validWeight.value;
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
    final cubit = context.watch<WeghtCubit>();
    final state = cubit.state;
    final valid = state.validWeight;

    return AppCard(
      child: Column(
        children: [
          const TitleSub(text: 'Укажите свой текущий вес'),
          const SizedBox(height: 10),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Вес',
              errorText: valid.errorText(l: l),
              errorMaxLines: 2,
              suffixText: 'кг',
            ),
            keyboardType: TextInputType.number,
            onChanged: (v) => cubit.checkWeight(v: v),
            inputFormatters: [LengthLimitingTextInputFormatter(6)],
          ),
        ],
      ),
    );
  }
}
