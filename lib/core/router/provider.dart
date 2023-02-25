import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrition/core/local_storage/provider.dart';
import 'package:nutrition/core/router/doiman/app_router_service.dart';


final appRouterProvider = Provider<AppRouterService>((ref) {
  final storage = ref.read(appLocalStorageProvider);

  return AppRouterService(storage: storage);
});
