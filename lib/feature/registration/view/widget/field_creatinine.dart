// ignore_for_file:  avoid-nested-conditional-expressions, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition/core/utils/utils.dart';
import 'package:nutrition/feature/registration/registration.dart';
import 'package:nutrition/feature/widgets/widgets.dart';
import 'package:nutrition/localization/localization.dart';

class FieldCreatinine extends StatefulWidget {
  const FieldCreatinine({
    super.key,
  });

  @override
  State<FieldCreatinine> createState() => _FieldCreatinineState();
}

class _FieldCreatinineState extends State<FieldCreatinine> {
  late final TextEditingController controller;

  @override
  void initState() {
    var initValue = '';

    final initDouble = context.read<CkdCubit>().state.validCreatinine.value;
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
    final cubit = context.watch<CkdCubit>();

    final l = context.l10n;
    final state = cubit.state;
    final valid = state.validCreatinine;

    const maxLength = 6;
    // print('--build ${valid.externalError}');

    return Visibility(
      visible: state.isVisibleCreatinine,
      child: AppCard(
        child: Column(
          children: [
            const TitleSub(
              text: 'Укажите свой креатинин',
              dialogText:
                  'Мы используем эти сведения для расчета клубочковой фильтрации',
            ),
            Column(
              children: [
                const DropInputTypeCreatinine(),
                const SizedBox(height: 10),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: _getText(
                      type: state.inputTypeCreatinine,
                    ),
                    errorText: valid.errorText(l: l),
                    errorMaxLines: 5,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (v) => _changeCreatinine(context, v),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(maxLength),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _changeCreatinine(BuildContext context, String v) {
    final ckdCubit = context.read<CkdCubit>();
    final brithdayCubit = context.read<BrithdayCubit>();
    final genderCubit = context.read<GenderCubit>();

    ckdCubit.checkCreatinine(
      v: v,
      isValidBirthday: brithdayCubit.state.validBirthday.isValid,
      isValidGender: genderCubit.state.validGender.isValid,
    );
  }

  String _getText({
    required EnumInputTypeCreatinine type,
  }) {
    return type.map(
      mgDl: () => 'Норма: 0.3 - 1.3',
      mcmolL: () => 'Норма: 62 - 115',
    );
  }
}
