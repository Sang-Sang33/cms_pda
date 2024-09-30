import 'package:cms_pda/commons/global_configs.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarContainer extends StatelessWidget {
  const BottomNavigationBarContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xfff7fbff),
        boxShadow: [
          GlobalConfigs.shadow,
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: child,
    );
  }
}
