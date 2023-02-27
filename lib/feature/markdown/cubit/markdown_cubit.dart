import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

part 'markdown_state.dart';

final _log = Logger('MarkdownCubit');

class MarkdownCubit extends Cubit<MarkdownState> {
  MarkdownCubit() : super(const MarkdownState.initial());

  Future<void> load({String? url}) async {
    _log.info(url);


    
  }
}
