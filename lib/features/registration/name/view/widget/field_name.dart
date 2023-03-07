import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:nutrition/core/widget/app_card.dart';
import 'package:nutrition/core/widget/widget.dart';
import 'package:nutrition/features/registration/name/name.dart';

import 'package:nutrition/localization/localization.dart';

class FieldName extends ConsumerStatefulWidget {
  const FieldName({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FieldNameState();
}

class _FieldNameState extends ConsumerState<FieldName> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(
      text: ref.read(registrationNameProvider).nameValid.value,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(registrationNameProvider);
    final notifier = ref.watch(registrationNameProvider.notifier);
    final l = context.l10n;

    return AppCard(
      child: Column(
        children: [
          const TitleSub(text: 'Введите имя'),
          const SizedBox(height: 10),
          TypeAheadField(
            suggestionsCallback: notifier.getSuggestionsName,
            itemBuilder: (context, String suggestion) {
              return ListTile(title: Text(suggestion));
            },
            onSuggestionSelected: _suggestionSelected,
            textFieldConfiguration: TextFieldConfiguration(
              controller: controller,
              onChanged: notifier.setName,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: l.name,
                errorText: state.nameValid.errorMessage,
              ),
            ),
            hideOnLoading: true,
            hideOnEmpty: true,
            hideOnError: true,
          ),
        ],
      ),
    );
  }

  void _suggestionSelected(String suggestion) {
    final _ = ref.read(registrationNameProvider.notifier).setName(suggestion);
    controller.text = suggestion;
  }
}
