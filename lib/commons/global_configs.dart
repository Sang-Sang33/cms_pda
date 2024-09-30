import 'package:flutter/material.dart';

class GlobalConfigs {
  static const shadow = BoxShadow(
    color: Color.fromARGB(255, 200, 218, 230),
    spreadRadius: 2,
    blurRadius: 7,
    offset: Offset(0, 2), // 阴影偏移量，x轴为0，y轴为3
  );
  static const successColor = Color(0xFF66BB6A);
  static const warningColor = Color(0xffff8239);
  static const errorColor = Color(0xffef4444);
  static const processingColor = Color(0xff00aaff);
  static const eob12 = EdgeInsets.only(bottom: 12);
}
