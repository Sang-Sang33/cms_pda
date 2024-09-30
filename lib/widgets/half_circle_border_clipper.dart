import 'dart:math';

import 'package:cms_pda/commons/global_configs.dart';
import 'package:flutter/material.dart';

class HalfCircleBorderClipper extends CustomClipper<Path> {
  static const radius = 10.0;
  static const offsetX = 40.0;
  static const offsetY = -4.0;
  static const space = 28;

  @override
  Path getClip(Size size) {
    Path path = Path();
    Rect rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    path.addRect(rect);

    Path holePath = Path();
    // 计算半圆两点的宽度
    final dis = sqrt(pow(radius, 2) - pow(offsetY, 2)) * 2;
    // 计算每个半圆之间的距离
    final s = space - dis;
    // 计算半圆个数
    final count = ((size.width - offsetX * 2 + s) / (s + dis)).floor();
    for (var i = 0; i <= count; i++) {
      final dx = offsetX + i * space;
      holePath.addArc(
        Rect.fromCircle(center: Offset(dx, offsetY), radius: radius),
        0.0,
        pi,
      );
    }
    path = Path.combine(PathOperation.difference, path, holePath);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class HalfCircleBorderContainer extends StatelessWidget {
  const HalfCircleBorderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HalfCircleBorderClipper(),
      child: Container(
        padding: const EdgeInsets.all(24),
        margin: GlobalConfigs.eob12,
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor,
          boxShadow: const [
            GlobalConfigs.shadow,
          ],
        ),
        child: child,
      ),
    );
  }
}
