import 'package:flutter/material.dart';

class MainDescription extends StatelessWidget {
  const MainDescription({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xffa0fffd),
            fontSize: 18,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            color: Color(0xffceff7b),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
