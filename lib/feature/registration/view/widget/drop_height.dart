import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition/app/style/style.dart';
import 'package:nutrition/core/widget/widget.dart';
import 'package:nutrition/feature/registration/registration.dart';
import 'package:nutrition/feature/widgets/widgets.dart';

class DropHeight extends StatelessWidget {
  const DropHeight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegistrationCubit>();

    return AppCard(
      child: BlocBuilder<RegistrationCubit, RegistrationState>(
        buildWhen: (p, c) =>
            p.validHeight.isPure != c.validHeight.isPure ||
            p.validHeight.value != c.validHeight.value,
        builder: (context, state) {
          final valid = state.validHeight;

          return Column(
            children: [
              const TitleSub(text: 'Укажите свой рост'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppDropDown(
                    hint: 'Рост',
                    value: state.validHeight.value,
                    onChanged: cubit.checkHeight,
                    values: state.heightList,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'см',
                    style: AppTextStyles.caption(),
                  ),
                ],
              ),
              if (valid.error == valid.notSelected && !valid.isPure)
                const ErrorMsg(error: 'Рост не выбран'),
            ],
          );
        },
      ),
    );
  }
}
