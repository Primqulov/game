import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final int level;
  final int coins;

  const TopBar({
    super.key,
    required this.level,
    required this.coins,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'LEVEL',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.3,
                  color: Color(0xFF6D7D87),
                ),
              ),
              Text(
                '$level',
                style: const TextStyle(
                  fontSize: 28,
                  height: 1,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF2F4455),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: const Color(0xFFEDEDED),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFF4BC2A),
                  ),
                  child: const Center(
                    child: Icon(Icons.attach_money, size: 14, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '$coins',
                  style: const TextStyle(
                    fontSize: 28,
                    height: 1,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF2F4455),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 34,
            height: 34,
            child: Icon(
              Icons.menu,
              size: 26,
              color: Color(0xFF355266),
            ),
          ),
        ],
      ),
    );
  }
}
