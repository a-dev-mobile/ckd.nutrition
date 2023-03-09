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
