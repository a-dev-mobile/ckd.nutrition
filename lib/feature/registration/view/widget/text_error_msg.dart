import 'package:flutter/material.dart';
import 'package:nutrition/core/utils/utils.dart';

class ErrorMsg extends StatelessWidget {
  const ErrorMsg({
    required this.error,
    super.key,
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
