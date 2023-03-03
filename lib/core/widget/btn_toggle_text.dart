import 'package:flutter/material.dart';
import 'package:nutrition/app/style/data.dart';


import 'package:nutrition/core/utils/utils.dart';

class BtnToggleText extends StatelessWidget {
  const BtnToggleText({
    required this.textList,
    required this.isSelected,
    required this.onPressed,
    this.onPressedAbout,
    super.key,
    this.title = '',
    this.errorText,
    this.infoBottom = '',
  });
  final List<String> textList;
  final String title;
  final String? errorText;
  final String infoBottom;
  final List<bool> isSelected;
  final void Function(int)? onPressed;
  final void Function()? onPressedAbout;
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
                IconButton(
                  onPressed: onPressedAbout,
                  icon: Icon(
                    Icons.info_outline,
                    color: context.theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
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

}
