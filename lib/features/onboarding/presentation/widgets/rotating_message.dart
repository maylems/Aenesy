import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';

class RotatingMessage extends StatefulWidget {
  const RotatingMessage({super.key});

  @override
  State<RotatingMessage> createState() => _RotatingMessageState();
}

class _RotatingMessageState extends State<RotatingMessage> {
  static const _messages = [
    'Aenesy Delivery.\nTrack your package seamlessly.',
    'We make your package tracking\nexperience real easy.',
    'Fast, reliable delivery\nright to your doorstep.',
  ];

  late final Timer _timer;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      setState(() => _index = (_index + 1) % _messages.length);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 700),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, animation) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(0, 0.12),
          end: Offset.zero,
        ).animate(animation);
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: offsetAnimation, child: child),
        );
      },
      child: Text(
        _messages[_index],
        key: ValueKey(_index),
        style: AppTextStyles.heroMessage,
      ),
    );
  }
}
