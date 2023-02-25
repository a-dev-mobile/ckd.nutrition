// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrition/core/connectivity_status/application/application.dart';

// final connectivityStatusProvider = StateNotifierProvider.autoDispose<
//     ConnectivityStatusController,
//     ConnectivityStatusState>((ref) => ConnectivityStatusController());

final connectivityStatusProvider =
    StreamProvider<ConnectivityStatusState>((ref) async {
  StreamSubscription<ConnectivityResult> _subscription;
  final stream =  Connectivity().onConnectivityChanged;

  var status = ConnectivityStatusState.notDetermined();

  await for (final a in stream.map()) {}
});
