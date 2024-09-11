import 'package:flutter/material.dart';

class GradientBorder extends StatelessWidget {
  const GradientBorder({
    super.key,
    required this.outerGradient,
    required this.innerGradient,
    required this.child,
  });

  final Gradient outerGradient;
  final Gradient innerGradient;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: outerGradient,
      ),
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: innerGradient,
        ),
        child: child,
      ),
    );
  }
}
