import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:nutrition/core/enum/enum.dart';
import 'package:nutrition/core/network/network_client.dart';
import 'package:nutrition/core/storage/storage.dart';
import 'package:nutrition/core/widget/page/app_error_page.dart';
import 'package:nutrition/core/widget/page/app_page_load.dart';
import 'package:nutrition/feature/markdown/markdown.dart';

class MarkdownPage extends StatelessWidget {
  const MarkdownPage({super.key, required this.model});
  static const path = '/Markdown';
  static const name = 'Markdown';

  final MarkdownModel model;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MarkdownCubit(
            client: context.read<NetworkClient>(),
            storage: context.read<AppStorage>(),
          )..load(model),
        ),
      ],
      child: _MarkdownPage(model),
    );
  }
}

class _MarkdownPage extends StatelessWidget {
  const _MarkdownPage(this.model);
  final MarkdownModel model;
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MarkdownCubit>();

    return cubit.state.map(
      load: (v) => const AppPageLoad(),
      success: (v) {
        switch (model.whatOpen) {
          case EnumWhatOpen.bottom:

          case EnumWhatOpen.dialog:
            return _MyMarkDownDialog(text: v.textMarkdown);

          case EnumWhatOpen.page:
            return _MyMarkDownPage(text: v.textMarkdown);
          case EnumWhatOpen.none:
            return const AppErrorPage(msg: 'EnumWhatOpen.none');
        }
      },
      error: (v) => AppErrorPage(msg: v.msg),
    );
  }
}

class _MyMarkDownDialog extends StatelessWidget {
  const _MyMarkDownDialog({
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return _MarkdownWidget(text: text);
    
  }
}

class _MyMarkDownPage extends StatelessWidget {
  const _MyMarkDownPage({
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    const defPading = 10.0;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _MarkdownWidget(text: text),
            Positioned(
              left: defPading,
              right: defPading,
              bottom: defPading,
              child: ElevatedButton(
                onPressed: Navigator.of(context).pop,
                child: const Text('Закрыть'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MarkdownWidget extends StatelessWidget {
  const _MarkdownWidget({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Markdown(
      shrinkWrap: true,
      data: text,
      onTapLink: (text, href, title) {
        // print('1 $text');
        // print('2 $href');
        // print('3 $title');
      },
    );
  }
}
