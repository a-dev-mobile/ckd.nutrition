import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:nutrition/feature/registration/registration.dart';
import 'package:nutrition/feature/widgets/widgets.dart';
import 'package:nutrition/localization/localization.dart';

class FieldName extends StatefulWidget {
  const FieldName({
    required this.cubit,
    super.key,
  });

  final RegistrationCubit cubit;

  @override
  State<FieldName> createState() => _FieldNameState();
}

class _FieldNameState extends State<FieldName> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller =
        TextEditingController(text: widget.cubit.state.validName.value);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        final valid = state.validName;

        return AppCard(
          child: Column(
            children: [
              const TitleSub(text: 'Введите имя'),
              const SizedBox(height: 10),
              TypeAheadField(
                suggestionsCallback: widget.cubit.getSuggestionsName,
                itemBuilder: (context, String suggestion) {
                  return ListTile(title: Text(suggestion));
                },
                onSuggestionSelected: (String suggestion) {
                  widget.cubit.checkName(suggestion);
                  controller.text = suggestion;
                },
                textFieldConfiguration: TextFieldConfiguration(
                  controller: controller,
                  onChanged: widget.cubit.checkName,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: l.name,
                    errorText: valid.errorText(l: l),
                  ),
                ),
                hideOnLoading: true,
                hideOnEmpty: true,
                hideOnError: true,
              ),
            ],
          ),
        );
      },
      buildWhen: (p, c) =>
          p.validName.isPure != c.validName.isPure ||
          p.validName.value != c.validName.value,
    );
  }
}
