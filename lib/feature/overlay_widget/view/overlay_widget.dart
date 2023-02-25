import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrition/app/app.dart';
import 'package:nutrition/core/config/theme/theme.dart';
import 'package:nutrition/core/connectivity_status/connectivity_status.dart';
import 'package:nutrition/core/widget/widget.dart';
import 'package:nutrition/feature/debug_menu/debug_menu.dart';
import 'package:nutrition/feature/overlay_widget/overlay_widget.dart';
import 'package:nutrition/dart_define.dart';

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
         final state = ref.watch(connectivityStatusProvider);
    return Scaffold(
      body: Stack(
        children: [
          child,
          Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(connectivityStatusProvider);

              return state.maybeMap(
                orElse: () => const SizedBox.shrink(),
                isConnected: (v) => const SnackbarInternet(isVisible: true),
              );
            },
          ),
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
                onPressed: () => {},
                // GoRouter.of(context).pushNamed(DebugMenuPage.name),
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
