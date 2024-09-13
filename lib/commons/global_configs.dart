import 'package:flutter/material.dart';

class GlobalConfigs {
  static const shadow = BoxShadow(
    color: Color.fromARGB(255, 200, 218, 230),
    spreadRadius: 2,
    blurRadius: 7,
    offset: Offset(0, 2), // 阴影偏移量，x轴为0，y轴为3
  );
}
