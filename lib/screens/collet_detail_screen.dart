import 'package:cms_pda/models/material_info.dart';
import 'package:cms_pda/widgets/material_card.dart';
import 'package:flutter/material.dart';

const List<MaterialDetail> _materialDetails = [
  MaterialDetail(
    materialName: 'RCJY12313513435',
    materialNums: 168,
    order: 1,
  ),
  MaterialDetail(
    materialName: 'RCJY123135134545',
    materialNums: 16,
    order: 2,
  ),
  MaterialDetail(
    materialName: 'RCJY12313513435',
    materialNums: 56,
    order: 3,
  ),
  MaterialDetail(
    materialName: 'RCJY1231351345433',
    materialNums: 346,
    order: 4,
  ),
  MaterialDetail(
    materialName: 'RCJY1231351635435',
    materialNums: 454,
    order: 5,
  ),
  MaterialDetail(
    materialName: 'RCJY12534351635435',
    materialNums: 654,
    order: 6,
  ),
  MaterialDetail(
    materialName: 'RCJY167351635435',
    materialNums: 768,
    order: 7,
  ),
  MaterialDetail(
    materialName: 'RCJY123546635435',
    materialNums: 353,
    order: 8,
  ),
  MaterialDetail(
    materialName: 'RCJY1237561635435',
    materialNums: 544,
    order: 9,
  ),
  MaterialDetail(
    materialName: 'RCJY123756421435435',
    materialNums: 654,
    order: 10,
  ),
  MaterialDetail(
    materialName: 'RCJY1237545335435',
    materialNums: 213,
    order: 11,
  ),
  MaterialDetail(
    materialName: 'RCJY12375546635435',
    materialNums: 53,
    order: 12,
  ),
  MaterialDetail(
    materialName: 'RCJY1237561635435',
    materialNums: 34,
    order: 13,
  ),
  MaterialDetail(
    materialName: 'RCJY1237561635435',
    materialNums: 343,
    order: 14,
  ),
  MaterialDetail(
    materialName: 'RCJY12375613455435',
    materialNums: 45,
    order: 15,
  ),
  MaterialDetail(
    materialName: 'RCJY1237561564435',
    materialNums: 4536,
    order: 16,
  ),
];

class ColletDetailScreen extends StatelessWidget {
  const ColletDetailScreen({
    super.key,
    required this.materialName,
  });

  final String materialName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('收获列表'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const DetailTableTitle(),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList.separated(
                    itemBuilder: (context, index) => MaterialDetailItem(
                      detail: _materialDetails[index],
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 12),
                    itemCount: _materialDetails.length,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailTableTitle extends StatelessWidget {
  const DetailTableTitle({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        8,
      ),
      child: const Row(
        children: [
          SizedBox(
            width: 48,
            child: Text(
              '序号',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              '物料',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            width: 48,
            child: Text(
              '数量',
              style: TextStyle(
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
