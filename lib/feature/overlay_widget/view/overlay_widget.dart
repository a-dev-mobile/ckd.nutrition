import 'package:dio_log/dio_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrition/core/cubits/cubits.dart';
import 'package:nutrition/core/enum/enum.dart';
import 'package:nutrition/app/style/style.dart';

import 'package:nutrition/core/widget/widget.dart';
import 'package:nutrition/feature/debug_menu/debug_menu.dart';
import 'package:nutrition/feature/overlay_widget/overlay_widget.dart';
import 'package:nutrition/global.dart';

class OverlayWidget extends StatefulWidget {
  const OverlayWidget({
    required this.child,
    required this.goRouterState,
    super.key,
  });
  final Widget child;
  final GoRouterState goRouterState;

  @override
  State<OverlayWidget> createState() => _OverlayWidgetState();
}

class _OverlayWidgetState extends State<OverlayWidget> {
  @override
  void initState() {
    super.initState();

    context.read<InternetCubit>().check();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<RemoteConfigCubit, RemoteConfigState>(
          // ignore: prefer-extracting-callbacks
          listener: (context, state) {
            if (state.isNeedUpdate) {
              final _ = showModalBottomSheet<void>(
                context: context,
                builder: (context) {
                  return const IgnorePopView(child: UpdateAppPage());
                },
                isScrollControlled: true,
                useRootNavigator: true,
                isDismissible: false,
                enableDrag: false,
              );
            }
          },
        ),
        BlocListener<DebugCubit, DebugState>(
          listenWhen: (p, c) => p.isShowBtnHttpLog != c.isShowBtnHttpLog,
          // ignore: prefer-extracting-callbacks
          listener: (context, state) {
            if (state.isShowBtnHttpLog) {
              final _ = showDebugBtn(context);
            } else {
              final _ = dismissDebugBtn();
            }
          },
        ),
      ],
      child: Scaffold(
        body: Stack(
          children: [
            widget.child,
            BlocBuilder<InternetCubit, bool?>(
              builder: (context, state) => SnackbarInternet(isVisible: state),
            ),
            if (DartDefine.IS_DEBUG)
              Positioned(
                left: 0,
                bottom: 0,
                child: Text(
                  widget.goRouterState.location,
                  style: AppTextStyles.s20w600h24(Colors.red),
                ),
              ),
            if (DartDefine.IS_DEBUG)
              Positioned(
                right: 10,
                bottom: 2,
                child: OutlinedButton(
                  onPressed: () =>
                      GoRouter.of(context).pushNamed(DebugMenuPage.name),
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
      ),
    );
  }
}
