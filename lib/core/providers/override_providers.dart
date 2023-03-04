import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

/// Triggered from bootstrap() to complete futures
Future<List<Override>> overrideProviders() async {
  final sp = await SharedPreferences.getInstance();


  return <Override>[sharedPreferencesProvider.overrideWithValue(sp)];
}
/* 
      HydratedBloc.storage = await _hydratedStorageBuild();
      runApp(
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => AppStorage(isShowLog: true),
            ),
            RepositoryProvider(
              create: (context) => AppRouter(storage: context.read()),
            ),
            RepositoryProvider(
              create: (context) =>
                  DaDataClient(apiKey: DartDefine.API_KEY_DADATA),
            ),
          ],
          child: await app(),
        ),
      );

 */