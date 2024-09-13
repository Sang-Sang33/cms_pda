import 'package:cms_pda/models/material_info.dart';
import 'package:cms_pda/widgets/app_search_bar.dart';
import 'package:cms_pda/widgets/half_circle_border_clipper.dart';
import 'package:cms_pda/widgets/main_description.dart';
import 'package:cms_pda/widgets/material_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const List<MaterialInfo> _materialInfos = [
  MaterialInfo(
    materialName: '抛光垫（36寸）【23815181d3125】',
    materialNums: 300,
    orderCode: '45000627209',
    receivedNums: 300,
    isChecked: true,
  ),
  MaterialInfo(
    materialName: '超级光纤（36寸）【23815181d3125】',
    materialNums: 500,
    orderCode: '4500066576527209',
    receivedNums: 300,
    isChecked: false,
  ),
  MaterialInfo(
    materialName: '终端模块（36寸）【23815181d3125】',
    materialNums: 600,
    orderCode: '455430066576527209',
    receivedNums: 300,
    isChecked: false,
  ),
];

class CollectScreen extends StatefulWidget {
  const CollectScreen({super.key});

  @override
  State<CollectScreen> createState() => _CollectScreenState();
}

class _CollectScreenState extends State<CollectScreen> {
  void _onMaterialDetail(MaterialInfo info, BuildContext context) {
    print(info.orderCode);
    context.push('/collect/${info.orderCode}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('来料点收'),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: const Color.fromARGB(255, 219, 230, 240),
        child: FilledButton(
          onPressed: () {},
          child: const Text('前往质检'),
        ),
      ),
      body: Column(
        children: [
          AppSearchBar(
            hintText: '扫描送货单号',
            onChanged: (value) {
              print(value);
            },
          ),
          const HalfCircleBorderContainer(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: MainDescription(
                        label: '送货单',
                        value: '62204070102',
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      flex: 1,
                      child: MainDescription(
                        label: '库存地点',
                        value: 'Z001',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: MainDescription(
                        label: '收货人',
                        value: 'SEAL',
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      flex: 1,
                      child: MainDescription(
                        label: '创建日期',
                        value: '2024-09-11',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomScrollView(
              slivers: [
                SliverList.separated(
                  itemBuilder: (context, index) => MaterialCard(
                    materialInfo: _materialInfos[index],
                    onDetail: () =>
                        _onMaterialDetail(_materialInfos[index], context),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 12,
                  ),
                  itemCount: _materialInfos.length,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
