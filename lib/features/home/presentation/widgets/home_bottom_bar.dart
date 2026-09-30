import 'package:flutter/material.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFF0F0F0))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.inventory_2_outlined, color: Colors.black),
          ),
          Material(
            color: Colors.black,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {},
              child: const SizedBox(
                width: 52,
                height: 52,
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_outline, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
