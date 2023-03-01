import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:nutrition/feature/registration/registration.dart';
import 'package:nutrition/feature/widgets/widgets.dart';
import 'package:nutrition/localization/localization.dart';

class FieldName extends StatefulWidget {
  const FieldName({
    super.key,
  });

  @override
  State<FieldName> createState() => _FieldNameState();
}

class _FieldNameState extends State<FieldName> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(
        text: context.read<NameCubit>().state.validName.value,);
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
    final cubit = context.watch<NameCubit>();
    final valid = cubit.state.validName;

    return AppCard(
      child: Column(
        children: [
          const TitleSub(text: 'Введите имя'),
          const SizedBox(height: 10),
          TypeAheadField(
            suggestionsCallback: cubit.getSuggestionsName,
            itemBuilder: (context, String suggestion) {
              return ListTile(title: Text(suggestion));
            },
            onSuggestionSelected: (String suggestion) =>
                _suggestionSelected(cubit, suggestion),
            textFieldConfiguration: TextFieldConfiguration(
              controller: controller,
              onChanged: cubit.checkName,
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
  }

  void _suggestionSelected(NameCubit cubit, String suggestion) {
   final _ =  cubit.checkName(suggestion);
    controller.text = suggestion;
  }
}
