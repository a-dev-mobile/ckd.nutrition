// ignore_for_file: always_use_package_imports

import 'package:bloc/bloc.dart';


import 'package:nutrition/core/log/log.dart';


class LogBloc extends BlocObserver {
  

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    log.v({
        '🙏${bloc.runtimeType}':'transition',
        '🙏prev': '${transition.currentState}',
        '🙏curr': '${transition.nextState}',
      });
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    log.e('🚑 bloc: error: ${bloc.runtimeType} on error', error, stackTrace);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);

    log.v({
      '🙌${bloc.runtimeType}': 'change',
      '🙌prev': '${change.currentState}',
      '🙌curr': '${change.nextState}'
    });

    // ..v('++ ${prettyPrintJson(change.toString())}');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);

    log
      ..d(
        '✍ ${bloc.runtimeType}',
      )
      ..v('++ $event');
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    log.d('👍 ${bloc.runtimeType} on create');
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    log.d('👎 ${bloc.runtimeType}  on close');
  }
}
