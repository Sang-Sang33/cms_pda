import 'package:flutter/material.dart';

@immutable
class PalletizeInfo {
  const PalletizeInfo({
    required this.materialName,
    required this.materialCode,
    required this.materialInfo,
    required this.nums,
  });
  final String materialName;
  final String materialCode;
  final String materialInfo;
  final int nums;
}
