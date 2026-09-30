import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class HeroSearchCard extends StatelessWidget {
  const HeroSearchCard({
    super.key,
    required this.name,
    required this.controller,
    required this.onSearch,
  });

  final String name;
  final TextEditingController controller;
  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 28),
      decoration: BoxDecoration(
        color: AppColors.limeCard,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome back,\n$name',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Enter your package no. to get more information & updates',
            style: TextStyle(
              fontSize: 13.5,
              color: Colors.black87,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 56,
            padding: const EdgeInsets.only(left: 20, right: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter no. here...',
                      hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
                    ),
                  ),
                ),
                Material(
                  color: Colors.black,
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: onSearch,
                    child: const SizedBox(
                      width: 48,
                      height: 48,
                      child: Icon(Icons.search, color: Colors.white, size: 22),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
