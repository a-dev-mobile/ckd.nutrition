// ignore_for_file:  avoid-nested-conditional-expressions, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition/feature/registration/registration.dart';
import 'package:nutrition/feature/widgets/widgets.dart';
import 'package:nutrition/localization/localization.dart';

class FieldCreatinine extends StatefulWidget {
  const FieldCreatinine({
    required this.cubit,
    super.key,
  });

  final RegistrationCubit cubit;

  @override
  State<FieldCreatinine> createState() => _FieldCreatinineState();
}

class _FieldCreatinineState extends State<FieldCreatinine> {
  late final TextEditingController controller;

  @override
  void initState() {
    var initValue = '';
    final initDouble = widget.cubit.state.validCreatinine.value;
    if (initDouble != null) {
      initValue = initDouble.toString();
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

    return BlocBuilder<RegistrationCubit, RegistrationState>(
      // убрал тк от многих зависит
      // buildWhen: (p, c) =>
      //     p.validCreatinine.isPure != c.validCreatinine.isPure ||
      //     p.validCreatinine.value != c.validCreatinine.value ||
      //     p.validCkd.value != c.validCkd.value ||
          // зависим
      //     p.genderSelected != c.genderSelected ||
      //     p.validGender.isPure != c.validGender.isPure ||
      //     p.validGender.value != c.validGender.value ||
      //     p.validBirthday.isPure != c.validBirthday.isPure ||
      //     p.validBirthday.value != c.validBirthday.value ||
          // 
      //     p.isVisibleCreatinine != c.isVisibleCreatinine ||
      //     p.inputTypeCreatinine != c.inputTypeCreatinine,
      builder: (context, state) {
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
                        labelText:
                            _getText(type: state.inputTypeCreatinine, l: l),
                        errorText: valid.errorText(l: l),
                        errorMaxLines: 5,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (v) => widget.cubit.checkCreatinine(v: v),
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
      },
    );
  }

  String _getText({
    required EnumInputTypeCreatinine type,
    required AppLocalizations l,
  }) {
    return type.map(
      mgDl: () => 'Норма: 0.3 - 1.3',
      mcmolL: () => 'Норма: 62 - 115',
    );
  }
}
