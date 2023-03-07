import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrition/core/style/app_text_style.dart';

import 'package:nutrition/core/widget/widget.dart';
import 'package:nutrition/features/registration/name/name.dart';

class RegistrationNamePage extends ConsumerWidget {
  const RegistrationNamePage({super.key});
  static const path = '/RegistrationNamePage';
  static const name = 'RegistrationNamePage';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(registrationNameProvider);
    final notifier = ref.watch(registrationNameProvider.notifier);

    return ClearFocus(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Заполните данные'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.info),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                const SizedBox(height: 10),
                const _TitleMain(),
                const SizedBox(height: 20),
                const FieldName(),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      notifier.cleanName();
                    },
                    child: const Text('Начать'),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
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
