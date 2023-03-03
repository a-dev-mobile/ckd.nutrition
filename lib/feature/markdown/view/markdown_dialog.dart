import 'package:flutter/material.dart';

class DialogMarkdown {

static Future<void> showMarkdownDialog({
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


