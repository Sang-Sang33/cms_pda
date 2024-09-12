import 'package:flutter/material.dart';

@immutable
class MaterialInfo {
  const MaterialInfo({
    required this.materialName,
    required this.materialNums,
    required this.orderCode,
    required this.receivedNums,
    required this.isChecked,
  });

  final String materialName;
  final int materialNums;
  final String orderCode;
  final int receivedNums;
  final bool isChecked;
}

class MaterialDetail {
  const MaterialDetail({
    required this.materialName,
    required this.materialNums,
    required this.order,
  });

  final String materialName;
  final int materialNums;
  final int order;
}
