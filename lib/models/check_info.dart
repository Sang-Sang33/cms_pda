import 'package:cms_pda/commons/global_configs.dart';
import 'package:cms_pda/models/enum.dart';
import 'package:flutter/material.dart';

class CheckInfo {
  const CheckInfo({
    required this.materialCode,
    required this.nums,
    int? checkedNums,
    int? receivedNums,
  })  : checkedNums = checkedNums ?? 0,
        receivedNums = receivedNums ?? 0;

  final String materialCode;
  final int nums;
  final int checkedNums;
  final int receivedNums;
}

class CheckDetail extends CheckInfo {
  CheckDetail({
    required super.materialCode,
    required super.nums,
    required this.status,
    required this.result,
  });
  ScanCheckStatus status;
  ScanResult result;

  ({Color color, String text}) get statusValue {
    ({Color color, String text}) value = (color: Colors.grey, text: '默认');
    switch (status) {
      case ScanCheckStatus.complete:
        value = (color: GlobalConfigs.successColor, text: '完成');
        break;
      case ScanCheckStatus.processing:
        value = (color: GlobalConfigs.processingColor, text: '进行中');
        break;
      case ScanCheckStatus.error:
        value = (color: GlobalConfigs.errorColor, text: '故障中');
        break;
      default:
    }
    return value;
  }

  ({Color color, String text}) get resultValue {
    return result == ScanResult.ok
        ? (color: GlobalConfigs.successColor, text: 'OK')
        : (color: GlobalConfigs.warningColor, text: 'NG');
  }
}
