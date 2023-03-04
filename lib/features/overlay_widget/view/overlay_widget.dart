import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrition/core/providers/navigation/app_router_provider.dart';
import 'package:nutrition/core/style/app_text_style.dart';
import 'package:nutrition/features/debug_menu/debug_menu.dart';
import 'package:nutrition/global.dart';

class OverlayWidget extends ConsumerWidget {
  const OverlayWidget({
    required this.child,
    required this.goRouterState,
    super.key,
  });
  final Widget child;
  final GoRouterState goRouterState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  final state = ref.watch(connectivityStatusProvider);
    return Scaffold(
      body: Stack(
        children: [
          child,
          // Consumer(
          //   builder: (context, ref, child) {
          //     final state = ref.watch(connectivityStatusProvider);

          //     return state.maybeMap(
          //       orElse: () => const SizedBox.shrink(),
          //       isConnected: (v) => const SnackbarInternet(isVisible: true),
          //     );
          //   },
          // ),
          if (DartDefine.IS_DEBUG)
            Positioned(
              left: 0,
              bottom: 0,
              child: Text(
                goRouterState.location,
                style: AppTextStyles.s20w600h24(Colors.red),
              ),
            ),
          if (DartDefine.IS_DEBUG)
            Positioned(
              right: 10,
              bottom: 2,
              child: OutlinedButton(
                onPressed: () => ref
                    .read(appRouterProvider)
                    .router
                    .pushNamed(DebugMenuPage.name),
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text('debug', style: AppTextStyles.s20w600h24()),
              ),
            ),
        ],
      ),
    );
  }
}
