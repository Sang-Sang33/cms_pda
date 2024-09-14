import 'package:cms_pda/commons/global_configs.dart';
import 'package:cms_pda/models/material_info.dart';
import 'package:cms_pda/widgets/card_description.dart';
import 'package:flutter/material.dart';

class MaterialCard extends StatelessWidget {
  const MaterialCard({
    super.key,
    required this.materialInfo,
    required this.onDetail,
  });

  final MaterialInfo materialInfo;
  final VoidCallback onDetail;

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
              value: materialInfo.materialName,
            ),
            CardDescription(
              label: '数量',
              value: '${materialInfo.materialNums}',
            ),
            CardDescription(
              label: '采购单号',
              value: materialInfo.orderCode,
            ),
            CardDescription(
              label: '已收',
              value: '${materialInfo.receivedNums}',
              valueTextColor: const Color(0xff005cff),
              trailing: SizedBox(
                height: 32,
                child: OutlinedButton.icon(
                  onPressed: onDetail,
                  label: const Text('查看'),
                  icon: const Icon(Icons.remove_red_eye),
                ),
              ),
            ),
            CardDescription(
              label: '是否质检',
              value: materialInfo.isChecked ? '质检' : '未质检',
              valueTextColor: materialInfo.isChecked
                  ? GlobalConfigs.successColor
                  : GlobalConfigs.warningColor,
            ),
          ],
        ),
      ),
    );
  }
}

class MaterialDetailItem extends StatelessWidget {
  const MaterialDetailItem({
    super.key,
    required this.detail,
  });

  final MaterialDetail detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffe4f4ff),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
        border: Border.all(
          width: 1,
          color: const Color(0xffa6d6f7),
          style: BorderStyle.solid,
        ),
      ),
      padding: const EdgeInsets.all(
        8,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 48,
            child: Text(
              '${detail.order}',
              style: const TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              detail.materialName,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            width: 48,
            child: Text(
              '${detail.materialNums}',
              style: const TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
