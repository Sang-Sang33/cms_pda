import 'package:flutter/material.dart';

@immutable
class MaterialInfo extends MaterialDetail {
  const MaterialInfo({
    required super.materialName,
    required super.materialNums,
    required this.orderCode,
    required this.receivedNums,
    required this.isChecked,
  });

  final String orderCode;
  final int receivedNums;
  final bool isChecked;
}

class MaterialDetail {
  const MaterialDetail({
    required this.materialName,
    required this.materialNums,
    int? order,
  }) : order = order ?? 0;

  final String materialName;
  final int materialNums;
  final int order;
}
