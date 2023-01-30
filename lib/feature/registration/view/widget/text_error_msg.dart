import 'package:flutter/material.dart';
import 'package:nutrition/app/style/style.dart';

class ErrorMsg extends StatelessWidget {
  const ErrorMsg({
    super.key,
    required this.error,
  });
  final String error;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 6),
        Text(
          error,
          style: context.textTheme.bodySmall!
              .copyWith(color: context.theme.colorScheme.error),
        ),
      ],
    );
  }
}
