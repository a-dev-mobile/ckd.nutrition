// ignore_for_file: always_use_package_imports

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'logger.dart';

class LogRiverpod extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log
      ..d(
        '🙌 ++ CHANGE ${provider.name ?? provider.runtimeType}',
      )
      ..v(' ++ $newValue');
  }

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    log.d('👍 ++ ADD ${provider.name ?? provider.runtimeType}');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    log.e('🚑 ++ ERROR ${provider.name ?? provider.runtimeType}', error,
        stackTrace);
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    log.d('👎 ++ CLOSE ${provider.name ?? provider.runtimeType}');
  }
}
