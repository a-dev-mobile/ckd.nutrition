import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingItemImage extends StatelessWidget {
  const OnboardingItemImage({required this.assetName,super.key, });
  final String assetName;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(assetName, width: 150);
  }
}
