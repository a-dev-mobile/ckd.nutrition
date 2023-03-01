import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:nutrition/app/common/enum/enum.dart';

import 'package:nutrition/core/network/network_client.dart';
import 'package:nutrition/core/storage/storage.dart';

part 'markdown_state.dart';

class MarkdownCubit extends Cubit<MarkdownState> {
  MarkdownCubit({required NetworkClient client, required AppStorage storage})
      : _client = client,
        _storage = storage,
        super(const MarkdownState.load());

  final NetworkClient _client;
  final AppStorage _storage;

  Future<void> load() async {
    final model = _storage.getMarkdownModel();
    final lang = EnumLang.fromValue(
      _storage.getLocale(),
      fallback: EnumLang.en,
    );
  
    final url = lang.map(en: () => model.urlEN, ru: () => model.urlRU);

    if (url.isEmpty) {
      emit(const MarkdownState.error('Empty page address'));

      return;
    }

    try {
      final response = await _client.request(method: Method.get, url: url);

      if (response.statusCode == 200) {
        emit(MarkdownState.success(textMarkdown: response.data.toString()));

        return;
      } else {
        emit(const MarkdownState.error('Wrong page address'));
      }
    } on Object catch (e, stackTrace) {
      emit(MarkdownState.error(e.toString()));

      Error.throwWithStackTrace(e, stackTrace);
    }

    emit(const MarkdownState.error('Error loading'));
  }
}
