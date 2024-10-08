import 'package:cms_pda/commons/global_configs.dart';
import 'package:cms_pda/models/check_info.dart';
import 'package:cms_pda/widgets/card_description.dart';
import 'package:flutter/material.dart';

class CheckCard extends StatelessWidget {
  const CheckCard({
    super.key,
    required this.checkInfo,
    double? labelWidth,
  }) : labelWidth = labelWidth ?? 100;

  final CheckInfo checkInfo;
  final double labelWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          GlobalConfigs.shadow,
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          children: <Widget>[
            CardDescription(
              label: '物料',
              value: checkInfo.materialCode,
              labelWidth: labelWidth,
            ),
            CardDescription(
              label: '总数量',
              value: '${checkInfo.nums}',
              labelWidth: labelWidth,
            ),
            CardDescription(
              label: '抽检数量',
              value: checkInfo.checkedNums.toString(),
              labelWidth: labelWidth,
            ),
            CardDescription(
              label: '已抽检数量',
              value: checkInfo.receivedNums.toString(),
              valueTextColor: const Color(0xff005cff),
              labelWidth: labelWidth,
            ),
          ],
        ),
      ),
    );
  }
}
