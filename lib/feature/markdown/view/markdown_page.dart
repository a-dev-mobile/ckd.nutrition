import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:nutrition/core/storage/storage.dart';
import 'package:nutrition/core/widget/progress_indicator/app_page_load.dart';
import 'package:nutrition/feature/markdown/markdown.dart';


class MarkdownPage extends StatelessWidget {
  const MarkdownPage({super.key});
  static const path = '/Markdown';
  static const name = 'Markdown';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MarkdownCubit(
              client: context.read(), storage: context.read<AppStorage>(),)
            ..load(),
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


    final cubit = context.watch<MarkdownCubit>();

    return Scaffold(
      body: SafeArea(
        child: cubit.state.map(
          load: (v) => const AppPageLoad(),
          success: (v) => _MyMarkDownPage(
            text: v.textMarkdown,
          ),
          error: (v) => Center(child: Text(v.msg)),
        ),
      ),
    );
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

    return Stack(
      children: [
        Markdown(
          data: text,
          onTapLink: (text, href, title) {
            // print('1 $text');
            // print('2 $href');
            // print('3 $title');
 
          },

        ),
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
    );
  }
}
