import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrition/core/services/locale/locale_provider.dart';

import 'package:nutrition/core/widget/widget.dart';
import 'package:nutrition/features/registration/name/name.dart';
import 'package:nutrition/localization/localization.dart';

class RegistrationNamePage extends ConsumerWidget {
  const RegistrationNamePage({super.key});
  static const path = '/RegistrationNamePage';
  static const name = 'RegistrationNamePage';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final provider = ref.watch(registrationNameProvider);
    final notifier = ref.watch(registrationNameProvider.notifier);
    final loc = ref.watch(appLocalizationsProvider);
    // final locale = ref.watch(localeProvider);
    final localeNotifier = ref.watch(localeProvider.notifier);

    return ClearFocus(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Заполните данные'),
          actions: [
            IconButton(
              onPressed: localeNotifier.changeLocale,
              icon: const Icon(Icons.info),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              shrinkWrap: true,
              children: [
                const TitleMain(text: 'Здраствуйте!\nКак Ваше имя?'),
                const FieldName(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: notifier.checkValid,
                    child: Text(loc.next),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: notifier.checkValid,
                    child: Text(loc.skip),
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
