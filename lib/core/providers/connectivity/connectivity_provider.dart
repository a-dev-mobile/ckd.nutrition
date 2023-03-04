import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrition/core/providers/connectivity/connectivity_state.dart';

class ConnectivityController extends StateNotifier<ConnectivityState> {
  ConnectivityController() : super(const ConnectivityState.notDetermined()) {
    _subscription = Connectivity().onConnectivityChanged.listen(_check);
  }
  late StreamSubscription<ConnectivityResult> _subscription;

  bool get isConnected => _result != ConnectivityResult.none;

  static ConnectivityResult _result = ConnectivityResult.none;

  static ConnectivityState _check(ConnectivityResult result) {
    _result = result;

    return _result == ConnectivityResult.none
        ? const ConnectivityState.isDisonnected()
        : const ConnectivityState.isConnected();
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
