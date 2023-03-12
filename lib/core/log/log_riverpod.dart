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
    log.v({
      '🙌 didUpdateProvider': '${provider.name ?? provider.runtimeType}',
      '🙌 prev': '$previousValue',
      '🙌 curr': '$newValue',
    });
  }

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    log.d({
      '👍 didAddProvider ${provider.name ?? provider.runtimeType}':
          '${provider.name ?? provider.runtimeType}',
      '👍 value': value,
    });
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    logger.e(
      '🚑 ERROR ${provider.name ?? provider.runtimeType}',
      error,
      stackTrace,
    );
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    log.d({
      '👎 didDisposeProvider ${provider.name ?? provider.runtimeType}':
          '${provider.name ?? provider.runtimeType}',
    });
  }
}
