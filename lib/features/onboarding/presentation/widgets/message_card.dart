import 'package:flutter/material.dart';

import '../../../../core/widgets/pill_arrow_button.dart';
import 'rotating_message.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(28, 32, 24, 24),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(child: RotatingMessage()),
          Align(
            alignment: Alignment.bottomRight,
            child: PillArrowButton(onPressed: onNext),
          ),
        ],
      ),
    );
  }
}
