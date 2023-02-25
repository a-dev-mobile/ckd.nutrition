// // ignore_for_file: lines_longer_than_80_chars

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:nutrition/core/widget/widget.dart';
// import 'package:nutrition/feature/registration/registration.dart';
// import 'package:nutrition/feature/widgets/widgets.dart';
// import 'package:nutrition/localization/localization.dart';

// class BtnHypertension extends StatelessWidget {
//   const BtnHypertension({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final l = context.l10n;
//     final cubit = context.read<RegistrationCubit>();

//     return AppCard(
//       child: BlocBuilder<RegistrationCubit, RegistrationState>(
//         buildWhen: (p, c) =>
//             p.validHypertension.isPure != c.validHypertension.isPure ||
//             p.validHypertension.value != c.validHypertension.value,
//         builder: (context, state) {
//           final valid = state.validHypertension;

//           return BtnToggleText(
//             textList: [l.yes_caps, l.no_caps],
//             isSelected: state.hypertensionSelected,
//             onPressed: cubit.checkHypertension,
//             dialogText: l.info_hypertension,
//             errorText: valid.isPure
//                 ? null
//                 : valid.error == valid.notSelected
//                     ? 'Подтвердите отсутствие или наличие гипертензии'
//                     : null,
//             title: 'Наличие гипертензии (высокое кровяное давление)',
//           );
//         },
//       ),
//     );
//   }
// }
