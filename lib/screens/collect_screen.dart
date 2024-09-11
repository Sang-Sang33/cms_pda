import 'package:cms_pda/widgets/app_search_bar.dart';
import 'package:flutter/material.dart';

class CollectScreen extends StatefulWidget {
  const CollectScreen({super.key});

  @override
  State<CollectScreen> createState() => _CollectScreenState();
}

class _CollectScreenState extends State<CollectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('来料点收'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          AppSearchBar(
            hintText: '扫描送货单号',
            onChanged: (value) {
              print(value);
            },
          ),
          const Text('暂无数据')
        ],
      ),
    );
  }
}
