import 'package:flutter/material.dart';

/// A simple approximation of the Nike swoosh, drawn since no brand asset was
/// supplied for it (unlike Apple/Google/email, which use uploaded SVGs).
class NikeSwooshIcon extends StatelessWidget {
  const NikeSwooshIcon({super.key, this.color = Colors.black, this.size = 20});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _SwooshPainter(color)),
    );
  }
}

class _SwooshPainter extends CustomPainter {
  _SwooshPainter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width * 0.02, size.height * 0.62)
      ..cubicTo(
        size.width * 0.05,
        size.height * 0.78,
        size.width * 0.22,
        size.height * 0.88,
        size.width * 0.4,
        size.height * 0.84,
      )
      ..lineTo(size.width * 0.98, size.height * 0.2)
      ..cubicTo(
        size.width * 0.72,
        size.height * 0.42,
        size.width * 0.5,
        size.height * 0.56,
        size.width * 0.32,
        size.height * 0.6,
      )
      ..cubicTo(
        size.width * 0.2,
        size.height * 0.62,
        size.width * 0.1,
        size.height * 0.6,
        size.width * 0.02,
        size.height * 0.62,
      )
      ..close();

    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant _SwooshPainter oldDelegate) =>
      oldDelegate.color != color;
}
