import 'package:flutter/material.dart';

/// Draws a long horizontal arrow (shaft + chevron head), used inside the
/// pill-shaped call-to-action buttons across the app.
class LongArrowPainter extends CustomPainter {
  const LongArrowPainter({this.color = Colors.black});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final midY = size.height / 2;
    const headSize = 8.0;
    final tipX = size.width - 2;

    canvas.drawLine(Offset(2, midY), Offset(tipX, midY), paint);

    final path = Path()
      ..moveTo(tipX - headSize, midY - headSize)
      ..lineTo(tipX, midY)
      ..lineTo(tipX - headSize, midY + headSize);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant LongArrowPainter oldDelegate) =>
      oldDelegate.color != color;
}
