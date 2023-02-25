import 'package:flutter/material.dart';


import 'package:nutrition/core/config/config.dart';
import 'package:nutrition/core/utils/utils.dart';

class BtnToggleText extends StatelessWidget {
  const BtnToggleText({
    required this.textList,
    required this.isSelected,
    required this.onPressed,
    super.key,
    this.title = '',
    this.errorText,
    this.infoBottom = '',
    this.dialogText = '',
  });
  final List<String> textList;
  final String title;
  final String? errorText;
  final String dialogText;
  final String infoBottom;
  final List<bool> isSelected;
  final void Function(int)? onPressed;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title.isNotEmpty)
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyles.h6(),
                    ),
                  ),
                if (dialogText.isNotEmpty)
                  IconButton(
                    onPressed: () => _showInfoDialog(
                      context: context,
                      text: dialogText,
                    ),
                    icon: Icon(
                      Icons.info_outline,
                      color: context.theme.colorScheme.primary,
                    ),
                  ),
              ],
            ),
            if (dialogText.isEmpty) const SizedBox(height: 10),
            ToggleButtons(
              constraints: BoxConstraints.expand(
                // number 3 = becouse if less - ovverflow
                width: (constraint.maxWidth / textList.length) - 3,
              ),
              isSelected: isSelected,
              onPressed: onPressed,
              children: [
                for (var i in textList) Text(i),
              ],
            ),
            if (errorText != null) ...[
              const SizedBox(height: 6),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  errorText!,
                  style: context.textTheme.bodySmall!
                      .copyWith(color: context.theme.colorScheme.error),
                ),
              ),
            ],
            if (infoBottom.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                infoBottom,
                textAlign: TextAlign.center,
                style: AppTextStyles.caption(),
              ),
            ],
          ],
        );
      },
    );
  }

  Future<void> _showInfoDialog({
    required BuildContext context,
    required String text,
  }) async {
    return showDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(text),
        );
      },
    );
  }
}
