import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nutrition/core/connectivity_status/connectivity_status.dart';

class ConnectivityStatusController
    extends StateNotifier<ConnectivityStatusState> {
  ConnectivityStatusController()
      : super(const ConnectivityStatusState.notDetermined()) {
    _subscription = Connectivity().onConnectivityChanged.listen(_check);
  }
  late StreamSubscription<ConnectivityResult> _subscription;

  bool get isConnected => _result != ConnectivityResult.none;

  static ConnectivityResult _result = ConnectivityResult.none;

  static ConnectivityStatusState _check(ConnectivityResult result) {
    _result = result;

    return _result == ConnectivityResult.none
        ? const ConnectivityStatusState.isDisonnected()
        : const ConnectivityStatusState.isConnected();
  }

  Future<void> check() async {
    _result = await Connectivity().checkConnectivity();
    state = _check(_result);
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }
}
