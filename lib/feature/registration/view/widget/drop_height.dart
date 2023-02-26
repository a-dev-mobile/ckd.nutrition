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
    final cubit = context.watch<HeightCubit>();
    final state = cubit.state;
    final valid = state.validheight;

    return AppCard(
      child: Column(
        children: [
          const TitleSub(text: 'Укажите свой рост'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppDropDown(
                hint: 'Рост',
                value: valid.value,
                onChanged: (v) => cubit.checkHeight(v: v),
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
      ),
    );
  }
}
