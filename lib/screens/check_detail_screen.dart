import 'package:cms_pda/commons/global_configs.dart';
import 'package:cms_pda/models/check_info.dart';
import 'package:cms_pda/models/enum.dart';
import 'package:cms_pda/widgets/app_search_bar.dart';
import 'package:cms_pda/widgets/check_detail_card.dart';
import 'package:cms_pda/widgets/check_dialog.dart';
import 'package:cms_pda/widgets/half_circle_border_clipper.dart';
import 'package:cms_pda/widgets/main_description.dart';
import 'package:flutter/material.dart';

final List<CheckDetail> _checkDetails = [
  CheckDetail(
    materialCode: 'RCTKK3S848DF4817745',
    nums: 889,
    status: ScanCheckStatus.complete,
    result: ScanResult.ok,
  ),
  CheckDetail(
    materialCode: 'RCTKK3S848DF4817745',
    nums: 442,
    status: ScanCheckStatus.error,
    result: ScanResult.ng,
  ),
  CheckDetail(
    materialCode: 'RCTKK3S848DF4817745',
    nums: 339,
    status: ScanCheckStatus.processing,
    result: ScanResult.ok,
  ),
];

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
  ScanResult _result = ScanResult.ok;
  String _orderCode = '';

  @override
  void initState() {
    setState(() {
      _orderCode = widget.orderCode;
    });
    super.initState();
  }

  List<Widget> _buildRadioGroup() {
    return <Widget>[
      Radio<ScanResult>(
        value: ScanResult.ng,
        groupValue: _searchResult,
        onChanged: (val) => setState(
          () {
            _searchResult = val!;
          },
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      const Text('设置扫码为NG'),
      const SizedBox(
        width: 8,
      ),
      Radio<ScanResult>(
        value: ScanResult.ok,
        groupValue: _searchResult,
        onChanged: (val) => setState(
          () {
            _searchResult = val!;
          },
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      const Text('设置扫码为OK'),
    ];
  }

  Widget _buildCheckResultRadio(StateSetter setState) {
    return Row(
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
        Radio<ScanResult>(
          value: ScanResult.ok,
          groupValue: _result,
          onChanged: (val) => setState(() {
            _result = val!;
          }),
        ),
        const Text('OK'),
        Radio<ScanResult>(
          value: ScanResult.ng,
          groupValue: _result,
          onChanged: (val) => setState(() {
            _result = val!;
          }),
        ),
        const Text('NG'),
      ],
    );
  }

  Widget _buildReasonInput(StateSetter setState) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 84,
          child: Text(
            _result == ScanResult.ok ? 'OK原因' : 'NG原因',
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
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              hintText: _result == ScanResult.ok ? '请输入OK原因' : '请输入NG原因',
              hintStyle: const TextStyle(
                color: Color.fromARGB(255, 92, 163, 226),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            maxLines: 2,
          ),
        )
      ],
    );
  }

  Widget _buildForm() {
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
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 12,
      ),
      child: Column(
        children: [
          _buildCheckResultRadio(setState),
          _buildReasonInput(setState),
        ],
      ),
    );
  }

  void _onItemEdit(CheckDetail detail) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => CheckDialog(
        cancelCallBack: () {},
        confirmCallBack: () {},
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) =>
              SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 80,
                      child: Text(
                        '条码：',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff626262),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      detail.materialCode,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 80,
                      child: Text(
                        'OK数量：',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff626262),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      detail.nums.toString(),
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        'NG数量：',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff626262),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      '0',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                _buildCheckResultRadio(setState),
                _buildReasonInput(setState),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildList() {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList.separated(
            itemBuilder: (conetxt, index) => CheckDetailCard(
              checkDetail: _checkDetails[index],
              onDetail: () => _onItemEdit(_checkDetails[index]),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 12,
            ),
            itemCount: _checkDetails.length,
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
                      child: MainDescription(
                        label: '送货单',
                        value: _orderCode,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const Expanded(
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
                      child: MainDescription(
                        label: 'OK总数量',
                        value: '360',
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: MainDescription(
                        label: 'NG总数量',
                        value: '240',
                      ),
                    ),
                  ],
                ),
                _buildForm()
              ],
            ),
          ),
          _buildList()
        ],
      ),
    );
  }
}
