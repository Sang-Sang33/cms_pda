import 'package:cms_pda/commons/global_configs.dart';
import 'package:cms_pda/models/palletize_info.dart';
import 'package:cms_pda/widgets/app_search_bar.dart';
import 'package:cms_pda/widgets/bottom_navigation_bar_container.dart';
import 'package:cms_pda/widgets/palletize_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker_plus/flutter_picker_plus.dart';

const List<String> _locations = <String>[
  'A1-1',
  'A1-2',
  'A2-1',
  'B1-1',
  'B2-1',
  'B2-3',
];

class PalletizeScreen extends StatefulWidget {
  const PalletizeScreen({super.key});

  @override
  State<PalletizeScreen> createState() => _PalletizeScreenState();
}

class _PalletizeScreenState extends State<PalletizeScreen> {
  int currentFloor = 1;
  int _locationIndex = -1;

  List<PalletizeInfo> palletizeLists = [
    const PalletizeInfo(
      materialName: 'XC21蓝宝石',
      materialCode: 'SFDFG88847575181',
      materialInfo: '特殊符号 开冲 23*33*45',
      nums: 359,
    ),
    const PalletizeInfo(
      materialName: 'XY18无用大宝石',
      materialCode: 'SFDFG88847GD518121',
      materialInfo: '的确没有什么作用',
      nums: 442,
    ),
    const PalletizeInfo(
      materialName: 'XY23滴露石',
      materialCode: 'SFDFG8348147GD518121',
      materialInfo: '通便',
      nums: 442,
    ),
  ];

  void updateFloor(int floot) {
    setState(() {
      currentFloor = floot;
    });
  }

  showPickerModal() async {
    final result = await Picker(
      adapter: PickerDataAdapter<String>(
        pickerData: _locations,
      ),
      itemExtent: 32,
      changeToFirst: true,
      cancelText: '取消',
      confirmText: '确认',
      hideHeader: false,
      selectedTextStyle: const TextStyle(color: Colors.blue),
      onConfirm: (picker, value) {
        print(value.toString());
        print(picker.adapter.text);
      },
    ).showModal(context); //_sca
    print('result$result');
    if (result != null) {
      setState(() {
        _locationIndex = result[0];
      });
    }
  }

  String get currentLocation =>
      _locationIndex == -1 ? '请选择位置' : _locations[_locationIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('组垛埋货'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBarContainer(
        child: Row(
          children: [
            Expanded(
              child: FilledButton(
                onPressed: () {},
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(
                    Color(0xffd3eaf9),
                  ),
                ),
                child: Text(
                  '取消',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: FilledButton(
                onPressed: () {},
                child: const Text('保存'),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppSearchBar(
            hintText: '请扫描托盘位置或物流包装',
            onChanged: (value) {
              print(value);
            },
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                GlobalConfigs.shadow,
              ],
            ),
            margin: GlobalConfigs.eob12,
            child: Column(
              children: [
                Material(
                  child: ListTile(
                    leading: const Text(
                      '托盘位置：',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    tileColor: Colors.white,
                    title: Text(
                      currentLocation,
                      textAlign: TextAlign.right,
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      print(123);
                      showPickerModal();
                    },
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                FloorRadio(
                  currentFloor: currentFloor,
                  updateFloor: updateFloor,
                ),
                const Divider(
                  height: 1,
                ),
                Material(
                  child: ListTile(
                    leading: const Text(
                      '逻辑分区：',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    tileColor: Colors.white,
                    title: const Text(
                      '请选择分区',
                      textAlign: TextAlign.right,
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      print(123);
                    },
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                Material(
                  child: ListTile(
                    leading: const Text(
                      '托盘条码：',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    tileColor: Colors.white,
                    title: const Text(
                      'A0125181',
                      textAlign: TextAlign.right,
                    ),
                    trailing: Icon(
                      Icons.refresh_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onTap: () {
                      print(123);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList.separated(
                  itemBuilder: (context, index) => PalletizeCard(
                    palletizeInfo: palletizeLists[index],
                    onDelete: () {
                      setState(() {
                        palletizeLists.removeAt(index);
                      });
                    },
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 12,
                  ),
                  itemCount: palletizeLists.length,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FloorRadio extends StatelessWidget {
  const FloorRadio({
    super.key,
    required this.currentFloor,
    required this.updateFloor,
  });

  final int currentFloor;
  final ValueChanged<int> updateFloor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Text(
        '选层：',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      tileColor: Colors.white,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio(
            value: 1,
            groupValue: currentFloor,
            onChanged: (val) => updateFloor(val as int),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          const Text('第1层'),
          const SizedBox(
            width: 12,
          ),
          Radio(
            value: 2,
            groupValue: currentFloor,
            onChanged: (val) => updateFloor(val as int),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          const Text('第2层'),
        ],
      ),
    );
  }
}
