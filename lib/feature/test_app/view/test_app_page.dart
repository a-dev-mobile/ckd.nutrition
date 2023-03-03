// ignore_for_file: lines_longer_than_80_chars, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition/core/cubits/cubits.dart';
import 'package:nutrition/core/enum/enum.dart';

import 'package:nutrition/core/widget/widget.dart';
import 'package:nutrition/feature/test_app/test_app.dart';
import 'package:nutrition/localization/localization.dart';

class TestAppPage extends StatelessWidget {
  const TestAppPage({super.key});
  static const path = '/test-app';
  static const name = 'test_app';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestAppCubit(),
      child: const _TestFlashLibPage(),
    );
  }
}

class _TestFlashLibPage extends StatelessWidget {
  const _TestFlashLibPage();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    return Scaffold(
      body: SafeArea(
        child: ClearFocus(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<TestAppCubit>().loadNameNutrient();
                    },
                    child: Text('open ${l.app_name}'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<LangCubit>().changeLocale();
                    },
                    child: const Text('change locale'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ThemeCubit>().changeTheme();
                    },
                    child: const Text('change theme'),
                  ),
                ],
              ),
              // const Text(API_KEY_DADATA),
              // const Text(BASE_URL),
              BlocBuilder<TestAppCubit, TestAppState>(
                builder: (context, state) {
                  if (state.isLoad) return const LinearProgressIndicator();

                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.nameNutrient.length,
                      itemBuilder: (context, index) {
                        final name = state.nameNutrient[index];

                        return ListTile(
                          title: Text(name),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
