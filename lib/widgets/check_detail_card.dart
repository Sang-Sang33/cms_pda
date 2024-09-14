import 'package:cms_pda/commons/global_configs.dart';
import 'package:cms_pda/models/check_info.dart';
import 'package:cms_pda/widgets/card_description.dart';
import 'package:flutter/material.dart';

class CheckDetailCard extends StatelessWidget {
  const CheckDetailCard({
    super.key,
    required this.checkDetail,
  });

  final CheckDetail checkDetail;

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
              label: '条码',
              value: checkDetail.materialCode,
            ),
            CardDescription(
              label: '数量',
              value: '${checkDetail.nums}',
            ),
            CardDescription(
              label: '状态',
              value: checkDetail.statusValue.text,
              valueTextColor: checkDetail.statusValue.color,
            ),
            CardDescription(
              label: '结果',
              value: checkDetail.resultValue.text,
              valueTextColor: checkDetail.resultValue.color,
            ),
          ],
        ),
      ),
    );
  }
}
