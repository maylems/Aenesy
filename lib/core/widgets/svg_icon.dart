import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A single-color SVG icon, tinted with [color] via a color filter — for
/// brand marks (Apple, email envelope) that ship as flat single-color SVGs.
class SvgIcon extends StatelessWidget {
  const SvgIcon(this.assetPath, {super.key, required this.color, this.size = 20});

  final String assetPath;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
