import 'package:flutter/material.dart';

class StatsInfoCard extends StatelessWidget {
  const StatsInfoCard({
    super.key,
    required this.progress,
    required this.leadingText,
    required this.lastText,
  });

  final double progress;
  final String leadingText;
  final String lastText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              leadingText,
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            height: 28,
            width: 300 * progress,
            color: Colors.deepPurple,
          ),
          const SizedBox(width: 8),
          Text(
            lastText,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
