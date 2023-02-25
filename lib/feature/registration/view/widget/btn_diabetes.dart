// // ignore_for_file: lines_longer_than_80_chars

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:nutrition/core/widget/widget.dart';
// import 'package:nutrition/feature/registration/registration.dart';
// import 'package:nutrition/feature/widgets/widgets.dart';
// import 'package:nutrition/localization/localization.dart';

// class BtnDiabetes extends StatelessWidget {
//   const BtnDiabetes({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final l = context.l10n;
//     final cubit = context.read<RegistrationCubit>();

//     return AppCard(
//       child: BlocBuilder<RegistrationCubit, RegistrationState>(
//         buildWhen: (p, c) =>
//             p.validDiabetes.isPure != c.validDiabetes.isPure ||
//             p.validDiabetes.value != c.validDiabetes.value,
//         builder: (context, state) {
//           final valid = state.validDiabetes;

//           return BtnToggleText(
//             textList: [l.yes_caps, l.no_caps],
//             isSelected: state.diabetesSelected,
//             onPressed: cubit.checkDiabetes,
//             dialogText: l.info_diabets,
//             errorText: valid.isPure
//                 ? null
//                 : valid.error == valid.notSelected
//                     ? 'Подтвердите отсутствие или наличие диабета'
//                     : null,
//             title: 'Наличие диабета',
//           );
//         },
//       ),
//     );
//   }
// }
