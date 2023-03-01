// ignore_for_file: unused_local_variable

import 'package:dadata/dadata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition/app/style/style.dart';
import 'package:nutrition/core/storage/app_storage.dart';
import 'package:nutrition/core/widget/widget.dart';
import 'package:nutrition/feature/registration/registration.dart';
import 'package:nutrition/navigation/navigation.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});
  static const path = '/registration';
  static const name = 'registration';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegistrationCubit(
            router: context.read<AppRouter>(),
            storage: context.read<AppStorage>(),
          )..load(),
        ),
        BlocProvider(create: (context) => CkdCubit()),
        BlocProvider(create: (context) => WeghtCubit()),
        BlocProvider(create: (context) => HeightCubit()),
        BlocProvider(
          create: (context) => GenderCubit(
            router: context.read<AppRouter>(),
            storage: context.read<AppStorage>(),
          ),
        ),
        BlocProvider(create: (context) => ActivityCubit()),
        BlocProvider(create: (context) => BrithdayCubit()),
        BlocProvider(create: (context) => DiabetesCubit()),
        BlocProvider(create: (context) => DiuresisCubit()),
        BlocProvider(create: (context) => HypertensionCubit()),
        BlocProvider(
          create: (context) => NameCubit(
            clienTips: context.read<DaDataClient>(),
            storage: context.read<AppStorage>(),
          ),
        ),
      ],
      child: const _RegistrationPage(),
    );
  }
}

class _RegistrationPage extends StatelessWidget {
  const _RegistrationPage();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegistrationCubit>();

    // final l = context.l10n;
    return ClearFocus(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Заполните данные'),
          actions: [
            IconButton(
              onPressed: cubit.goAboutGender,
              icon: const Icon(Icons.info),
            ),
            IconButton(
              onPressed: cubit.pushSetting,
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: SafeArea(
          child: BlocBuilder<RegistrationCubit, RegistrationState>(
            builder: (context, state) {
              if (state.isLoadPage) return const AppPageLoad();

              // print('main update');

              return LoadNextPage(
                isLoad: state.isLoadNextPage,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView(
                    children: [
                      const SizedBox(height: 10),
                      const _TitleMain(),
                      const SizedBox(height: 20),
                      const FieldName(),
                      const BtnGender(),
                      const DropBirthday(),
                      const DropHeight(),
                      const FieldWeight(),
                      const BtnActivity(),
                      const BtnHypertension(),
                      const BtnDiabetes(),
                      const BtnDailyDiuresis(),
                      const FieldUrineOutput(),
                      const BtnCkd(),
                      const FieldCreatinine(),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          // ignore: prefer-extracting-callbacks
                          onPressed: () {
                            final genderCubit = context.read<GenderCubit>()
                              ..checkValid();
                            final weightCubit = context.read<WeghtCubit>()
                              ..checkWeight(isCheckFromPage: true);
                            final brithdayCubit = context.read<BrithdayCubit>()
                              ..checkValid();
                            final height = context.read<HeightCubit>()
                              ..checkHeight(isCheckFromPage: true);

                            final activity = context.read<ActivityCubit>()
                              ..checkActivity(isCheckFromPage: true);
                            final hypertension = context
                                .read<HypertensionCubit>()
                              ..checkHypertension(isCheckFromPage: true);
                            final diabetes = context.read<DiabetesCubit>()
                              ..checkDiabetes(isCheckFromPage: true);

                            final regCubit = context.read<RegistrationCubit>();

                            final ckdIsValid =
                                context.read<CkdCubit>().checkCreatinine(
                                      isValidBirthday: brithdayCubit
                                          .state.validBirthday.isValid,
                                      isValidGender:
                                          genderCubit.state.validGender.isValid,
                                    );

                            // if (cubit.isValid()) {
                            //   // cubit.nextPage();
                            // }
                          },
                          child: const Text('Начать'),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text('Нажимая далее вы соглашаетесь с'),
                      TextButton(
                        onPressed: cubit.openPolicy,
                        child: const Text('Политика конфиденциальности'),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
            buildWhen: (p, c) =>
                p.isLoadPage != c.isLoadPage ||
                p.isLoadNextPage != c.isLoadNextPage,
          ),
        ),
      ),
    );
  }
}

class _TitleMain extends StatelessWidget {
  const _TitleMain();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Здраствуйте!\nРасскажите о себе',
      style: AppTextStyles.h4(),
      textAlign: TextAlign.center,
    );
  }
}
