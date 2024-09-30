import 'package:cms_pda/commons/global_configs.dart';
import 'package:cms_pda/models/palletize_info.dart';
import 'package:flutter/material.dart';

class PalletizeCard extends StatelessWidget {
  const PalletizeCard({
    super.key,
    required this.palletizeInfo,
    required this.onDelete,
  });

  final PalletizeInfo palletizeInfo;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        12,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          style: BorderStyle.solid,
          color: const Color(0xffa8d7f8),
        ),
        color: const Color(0xffe4f4ff),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${palletizeInfo.materialName}（${palletizeInfo.materialInfo}）',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                GlobalConfigs.shadow,
              ],
              borderRadius: BorderRadius.circular(48),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(palletizeInfo.materialCode),
                Text('总数：${palletizeInfo.nums.toString()}'),
                IconButton(
                  onPressed: onDelete,
                  icon: Icon(
                    Icons.delete_forever_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
