import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({required this.child, super.key});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(padding: const EdgeInsets.all(8), child: child),
    );
  }
}
