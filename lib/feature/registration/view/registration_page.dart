// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:nutrition/app/style/style.dart';
// import 'package:nutrition/core/local/doiman/app_local_storage_service.dart';
// import 'package:nutrition/core/widget/widget.dart';
// import 'package:nutrition/feature/registration/registration.dart';
// import 'package:nutrition/navigation/navigation.dart';

// class RegistrationPage extends StatelessWidget {
//   const RegistrationPage({super.key});
//   static const path = '/registration';
//   static const name = 'registration';
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => RegistrationCubit(
//             router: context.read<AppRouterService>(),
//             clienTips: context.read(),
//             storage: context.read<AppLocalStorageService>(),
//           )..load(),
//         ),
//       ],
//       child: const _RegistrationPage(),
//     );
//   }
// }

// class _RegistrationPage extends StatelessWidget {
//   const _RegistrationPage();

//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.read<RegistrationCubit>();

//     // final l = context.l10n;
//     return ClearFocus(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Заполните данные'),
//           actions: [
//             IconButton(
//               onPressed: cubit.pushSetting,
//               icon: const Icon(Icons.settings),
//             ),
//           ],
//         ),
//         body: SafeArea(
//           child: BlocBuilder<RegistrationCubit, RegistrationState>(
//             builder: (context, state) {
//               if (state.isLoadPage) return const AppPageLoad();

//               return LoadNextPage(
//                 isLoad: state.isLoadNextPage,
//                 child: Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: ListView(
//                     children: [
//                       const SizedBox(height: 10),
//                       const _TitleMain(),
//                       const SizedBox(height: 20),
//                       FieldName(cubit: cubit),
//                       const BtnGender(),
//                       const DropBirthday(),
//                       const DropHeight(),
//                       FieldWeight(cubit: cubit),
//                       const BtnActivity(),
//                       const BtnHypertension(),
//                       const BtnDiabetes(),
//                       const BtnDailyDiuresis(),
//                       FieldUrineOutput(cubit: cubit),
//                       const BtnCkd(),
//                       FieldCreatinine(cubit: cubit),
//                       const SizedBox(height: 20),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           // ignore: prefer-extracting-callbacks
//                           onPressed: () {
//                             if (cubit.isValid(context)) {
//                               cubit.nextPage();
//                             }
//                           },
//                           child: const Text('Начать'),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       const Text('Нажимая далее вы соглашаетесь с'),
//                       TextButton(
//                         onPressed: cubit.openPolicy,
//                         child: const Text('Политика конфиденциальности'),
//                       ),
//                       const SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//               );
//             },
//             buildWhen: (p, c) =>
//                 p.isLoadPage != c.isLoadPage ||
//                 p.isLoadNextPage != c.isLoadNextPage,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _TitleMain extends StatelessWidget {
//   const _TitleMain();

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       'Здраствуйте!\nРасскажите о себе',
//       style: AppTextStyles.h4(),
//       textAlign: TextAlign.center,
//     );
//   }
// }
