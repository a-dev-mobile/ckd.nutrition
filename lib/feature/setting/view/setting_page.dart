// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition/app/app.dart';
import 'package:nutrition/core/widget/widget.dart';
import 'package:nutrition/feature/setting/setting.dart';

import 'package:nutrition/feature/widgets/widgets.dart';
import 'package:nutrition/localization/localization.dart';
import 'package:nutrition/navigation/navigation.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  static const path = '/setting';
  static const name = 'setting';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SettingCubit(
            router: context.read<AppRouter>(),
            cubitTheme: context.read<ThemeCubit>(),
            cubitLocale: context.read<LocaleCubit>(),
          )..load(),
        ),
      ],
      child: const _SettingPage(),
    );
  }
}

class _SettingPage extends StatelessWidget {
  const _SettingPage();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SettingCubit>();

    final l = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l.setting)),
      body: SafeArea(
        child: ClearFocus(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                AppCard(
                  child: BlocBuilder<SettingCubit, SettingState>(
                    buildWhen: (p, c) => p.themeActive != c.themeActive,
                    builder: (context, state) {
                      return BtnToggleText(
                        onPressed: cubit.changeTheme,
                        textList: [l.light_theme, l.dark_theme],
                        isSelected: state.boolsTheme,
                        title: l.app_theme,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                AppCard(
                  child: BlocBuilder<SettingCubit, SettingState>(
                    buildWhen: (p, c) => p.localeActive != c.localeActive,
                    builder: (context, state) {
                      return BtnToggleText(
                        onPressed: cubit.changeLocale,
                        textList: [l.lang_en, l.lang_ru],
                        isSelected: state.boolsLocale,
                        title: l.app_lang,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
