import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// The real multi-color Google "G" logo used on the "Continue with Google"
/// button.
class GoogleGlyph extends StatelessWidget {
  const GoogleGlyph({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/google.svg',
      width: 20,
      height: 20,
    );
  }
}
