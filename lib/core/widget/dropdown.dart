import 'package:flutter/material.dart';

class AppDropDown extends StatelessWidget {
  const AppDropDown({
    required this.values,
    required this.onChanged,
    this.hint = '',
    super.key,
    this.value,
  });
  final List<String> values;
  final String hint;
  final String? value;
  final void Function(String?) onChanged;
  @override
  Widget build(BuildContext context) {
    // проверка на ошибку
    var isError = false;
    if (value != null) {
      isError = !values.contains(value);
    }

    return DropdownButton<String>(
      hint: hint.isEmpty ? null : Text(hint),
      value: isError ? null : value,
      items: [
        for (final v in values)
          DropdownMenuItem(
            value: v,
            child: Text(v),
          ),
      ],
      onChanged: onChanged,
    );
  }
}
