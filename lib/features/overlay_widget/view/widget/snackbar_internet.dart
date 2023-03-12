import 'package:flutter/material.dart';
import 'package:nutrition/core/style/app_text_style.dart';

import 'package:nutrition/core/utils/utils.dart';
import 'package:nutrition/localization/localization.dart';

class SnackbarInternet extends StatelessWidget {
  const SnackbarInternet({super.key, this.isVisible});
  final bool? isVisible;
  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    if (isVisible == null) return const SizedBox.shrink();

    return Visibility(
      visible: !isVisible!,
      child: Positioned(
        top: 0,
        child: Container(
          color: context.theme.colorScheme.error,
          width: context.widthPx,
          height: 50,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              l.no_internet,
              style: AppTextStyles.s16w500h24(Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
