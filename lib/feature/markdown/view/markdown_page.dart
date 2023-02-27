import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition/core/widget/progress_indicator/app_page_load.dart';
import 'package:nutrition/feature/markdown/markdown.dart';
import 'package:nutrition/localization/localization.dart';

class MarkdownPage extends StatelessWidget {
  const MarkdownPage({required this.url, super.key});
  static const path = '/Markdown';
  static const name = 'Markdown';

  final String? url;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MarkdownCubit()..load(url: url),
        ),
      ],
      child: const _MarkdownPage(),
    );
  }
}

class _MarkdownPage extends StatelessWidget {
  const _MarkdownPage();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    final cubit = context.watch<MarkdownCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('TITLE'),
      ),
      body: SafeArea(
        child: cubit.state.map(
          initial: (v) => Center(child: Text(v.msg)),
          load: (v) => const AppPageLoad(),
          success: (v) =>  Center(child: Text(v.text)),
          error: (v) =>  Center(child: Text(v.msg)),
        ),
      ),
    );
  }
}
