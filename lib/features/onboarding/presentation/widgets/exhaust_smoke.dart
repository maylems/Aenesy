import 'dart:math';

import 'package:flutter/material.dart';

/// Animated smoke puffs anchored to the exhaust pipe tip of the scooter in
/// `image.png`. The anchor is expressed as a fraction of this card's own
/// size (measured from the source image at pixel (550, 1002) of 1254x1254,
/// adjusted for the horizontal center-crop `BoxFit.cover` applies), so it
/// stays attached to the pipe across screen sizes without editing the image.
class ExhaustSmoke extends StatefulWidget {
  const ExhaustSmoke({super.key});

  @override
  State<ExhaustSmoke> createState() => _ExhaustSmokeState();
}

class _ExhaustSmokeState extends State<ExhaustSmoke>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<_SmokePuff> _puffs;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
    )..repeat();

    final random = Random(7);
    _puffs = List.generate(5, (i) {
      return _SmokePuff(
        phase: i / 5,
        sizeScale: 0.75 + random.nextDouble() * 0.5,
        driftScale: 0.8 + random.nextDouble() * 0.4,
        angleJitter: (random.nextDouble() - 0.5) * 0.5,
        wiggleSeed: random.nextDouble() * 10,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return CustomPaint(
          painter: _SmokePainter(_controller.value, _puffs),
        );
      },
    );
  }
}

class _SmokePuff {
  _SmokePuff({
    required this.phase,
    required this.sizeScale,
    required this.driftScale,
    required this.angleJitter,
    required this.wiggleSeed,
  });

  final double phase;
  final double sizeScale;
  final double driftScale;
  final double angleJitter;
  final double wiggleSeed;
}

class _SmokePainter extends CustomPainter {
  _SmokePainter(this.animationValue, this.puffs);

  final double animationValue;
  final List<_SmokePuff> puffs;

  // Fraction of this card's rendered size where the exhaust tip sits,
  // pre-adjusted for the symmetric horizontal crop from BoxFit.cover.
  static const _anchorX = 0.42;
  static const _anchorY = 0.80;

  @override
  void paint(Canvas canvas, Size size) {
    final anchor = Offset(size.width * _anchorX, size.height * _anchorY);
    final unit = size.width;

    for (final puff in puffs) {
      final t = (animationValue + puff.phase) % 1.0;
      final eased = Curves.easeOut.transform(t);

      final wiggle =
          sin(t * pi * 4 + puff.wiggleSeed) * unit * 0.008 * (1 - t * 0.5);
      final travel = eased * unit * 0.14 * puff.driftScale;
      final dx = anchor.dx - travel * (0.4 + puff.angleJitter) + wiggle;
      final dy = anchor.dy - travel * 0.9;

      final opacity = t < 0.18
          ? (t / 0.18) * 0.55
          : (1 - (t - 0.18) / 0.82) * 0.55;
      if (opacity <= 0.01) continue;

      final radius = (unit * 0.012 + unit * 0.03 * eased) * puff.sizeScale;

      final fillPaint = Paint()
        ..color = Colors.white.withValues(alpha: opacity)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, radius * 0.22);
      final rimPaint = Paint()
        ..color = const Color(0xFF9AA5A8).withValues(alpha: opacity * 0.55)
        ..style = PaintingStyle.stroke
        ..strokeWidth = radius * 0.12;

      final center = Offset(dx, dy);
      final blobs = [
        (center, radius),
        (center.translate(-radius * 0.55, radius * 0.15), radius * 0.62),
        (center.translate(radius * 0.5, radius * 0.1), radius * 0.55),
      ];
      for (final (blobCenter, blobRadius) in blobs) {
        canvas.drawCircle(blobCenter, blobRadius, fillPaint);
      }
      for (final (blobCenter, blobRadius) in blobs) {
        canvas.drawCircle(blobCenter, blobRadius, rimPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _SmokePainter oldDelegate) =>
      oldDelegate.animationValue != animationValue;
}
