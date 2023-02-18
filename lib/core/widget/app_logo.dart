import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutrition/gen/assets.gen.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.size = 192.0,
  });
  final double size;

  @override
  Widget build(BuildContext context) {
    // for nado_deneg
    return SvgPicture.asset(
      AppAssetsSVG.logo,
      width: size,
      height: size,
    );
  }
}
