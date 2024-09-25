import 'package:cms_pda/commons/global_configs.dart';
import 'package:cms_pda/widgets/app_search_bar.dart';
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
      changeToFirst: true,
      hideHeader: false,
      selectedTextStyle: const TextStyle(color: Colors.blue),
      onConfirm: (picker, value) {
        print(value.toString());
        print(picker.adapter.text);
      },
    ).showModal(context); //_sca
    print('result$result');
    setState(() {
      _locationIndex = result[0];
    });
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
      body: Column(
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
                )
              ],
            ),
          ),
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
