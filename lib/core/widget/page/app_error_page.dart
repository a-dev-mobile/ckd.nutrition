import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:nutrition/core/widget/progress_indicator/progress_indicator.dart';

/// {@template load_page}
/// Widget with disabling user action during load
/// {@endtemplate}
class AppErrorPage extends StatelessWidget {
  const AppErrorPage({
    super.key,
    required this.msg,
  });
  final String msg;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Center(
            child: Text(msg),
          ),
        ),
      );
}
