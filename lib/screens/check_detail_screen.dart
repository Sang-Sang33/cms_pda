import 'package:cms_pda/commons/global_configs.dart';
import 'package:cms_pda/models/value_label.dart';
import 'package:cms_pda/widgets/app_search_bar.dart';
import 'package:cms_pda/widgets/half_circle_border_clipper.dart';
import 'package:cms_pda/widgets/main_description.dart';
import 'package:flutter/material.dart';

class CheckDetailScreen extends StatefulWidget {
  const CheckDetailScreen({
    super.key,
    required this.orderCode,
  });
  final String orderCode;

  @override
  State<CheckDetailScreen> createState() => _CheckDetailScreenState();
}

class _CheckDetailScreenState extends State<CheckDetailScreen> {
  ScanResult _searchResult = ScanResult.ng;
  int _result = 1;
  String _orderCode = '';

  @override
  void initState() {
    setState(() {
      _orderCode = widget.orderCode;
    });
    super.initState();
  }

  List<Widget> _buildRadioGroup() {
    final List<Widget> groups = [];
    for (var element in ScanResult.values) {
      groups.addAll([
        Radio<ScanResult>(
          value: element,
          groupValue: _searchResult,
          onChanged: (val) => setState(
            () {
              _searchResult = val!;
            },
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Text(element.label),
      ]);
      if (element.index != ScanResult.values.length - 1) {
        groups.add(
          const SizedBox(
            width: 8,
          ),
        );
      }
    }
    return groups;
  }

  Widget _buildForm(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffccdcf9),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(
          color: Colors.white,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
      margin: const EdgeInsets.only(
        top: 12,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 84,
                child: Text(
                  '校验结果',
                  style: TextStyle(
                    color: Color.fromARGB(255, 50, 147, 232),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Radio<int>(
                value: ScanResult.ok.value,
                groupValue: _result,
                onChanged: (val) => setState(() {
                  _result = val!;
                }),
              ),
              const Text('OK'),
              Radio<int>(
                value: ScanResult.ng.value,
                groupValue: _result,
                onChanged: (val) => setState(() {
                  _result = val!;
                }),
              ),
              const Text('NG'),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 84,
                child: Text(
                  _result == ScanResult.ok.value ? 'OK原因' : 'NG原因',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 50, 147, 232),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    border: const OutlineInputBorder(),
                    hintText:
                        _result == ScanResult.ok.value ? '请输入OK原因' : '请输入NG原因',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 92, 163, 226),
                    ),
                  ),
                  maxLines: 2,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('校验单详情'),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: const Color.fromARGB(255, 219, 230, 240),
        child: FilledButton(
          onPressed: () {},
          child: const Text('提交数据'),
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
                    Expanded(
                      flex: 1,
                      child: MainDescription(
                        label: '送货单',
                        value: _orderCode,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const Expanded(
                      flex: 1,
                      child: MainDescription(
                        label: '抽检总数量',
                        value: '600',
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: MainDescription(
                        label: 'OK总数量',
                        value: '360',
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      flex: 1,
                      child: MainDescription(
                        label: 'NG总数量',
                        value: '240',
                      ),
                    ),
                  ],
                ),
                _buildForm(context)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
