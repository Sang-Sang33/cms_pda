import 'package:cms_pda/commons/global_configs.dart';
import 'package:cms_pda/models/check_info.dart';
import 'package:cms_pda/models/enum.dart';
import 'package:cms_pda/widgets/app_search_bar.dart';
import 'package:cms_pda/widgets/check_card.dart';
import 'package:cms_pda/widgets/half_circle_border_clipper.dart';
import 'package:cms_pda/widgets/main_description.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const List<CheckInfo> _checkInfos = [
  CheckInfo(
    materialCode: '3S848DF4817745',
    nums: 600,
    checkedNums: 500,
    receivedNums: 400,
  ),
  CheckInfo(
    materialCode: '3S848DF4354745',
    nums: 520,
    checkedNums: 500,
    receivedNums: 250,
  ),
  CheckInfo(
    materialCode: '3S83DF48145345',
    nums: 300,
    checkedNums: 100,
    receivedNums: 100,
  ),
  CheckInfo(
    materialCode: '3S848DF48153245',
    nums: 630,
    checkedNums: 300,
    receivedNums: 120,
  ),
];

class QcCheckScreen extends StatefulWidget {
  const QcCheckScreen({super.key});

  @override
  State<StatefulWidget> createState() => _QcCheckScreenState();
}

class _QcCheckScreenState extends State<QcCheckScreen> {
  UrgencyDegree _checkStatus = UrgencyDegree.normal;
  String _orderCode = '';

  List<Widget> _buildRadioGroup() {
    final List<Widget> groups = [
      const Text('请选择：'),
    ];
    for (var element in UrgencyDegree.values) {
      groups.addAll([
        Radio<UrgencyDegree>(
          value: element,
          groupValue: _checkStatus,
          onChanged: (val) => setState(
            () {
              _checkStatus = val!;
            },
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Text(element.label),
      ]);
      if (element.index != UrgencyDegree.values.length - 1) {
        groups.add(
          const SizedBox(
            width: 8,
          ),
        );
      }
    }
    return groups;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('来料QC抽检'),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: const Color.fromARGB(255, 219, 230, 240),
        child: FilledButton(
          onPressed: _orderCode.isEmpty
              ? null
              : () {
                  context.push('/qc/check/$_orderCode');
                },
          child: const Text('查看校验单'),
        ),
      ),
      body: Column(
        children: [
          AppSearchBar(
            hintText: '扫描送货单号',
            onChanged: (value) {
              print(value);
              setState(() {
                _orderCode = value;
              });
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                GlobalConfigs.shadow,
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildRadioGroup(),
            ),
          ),
          HalfCircleBorderContainer(
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: MainDescription(
                        label: '作业员',
                        value: 'admin',
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: MainDescription(
                        label: '送货单',
                        value: _orderCode,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: MainDescription(
                        label: '总数量',
                        value: '640',
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: MainDescription(
                        label: '需抽检总数量',
                        value: '600',
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(
                      child: MainDescription(
                        label: '已抽检数量',
                        value: '360',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList.separated(
                  itemBuilder: (context, index) => CheckCard(
                    checkInfo: _checkInfos[index],
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 12,
                  ),
                  itemCount: _checkInfos.length,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
