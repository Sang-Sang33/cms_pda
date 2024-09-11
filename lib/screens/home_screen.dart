import 'package:cms_pda/models/menu.dart';
import 'package:cms_pda/widgets/gradient_border.dart';
import 'package:cms_pda/widgets/pda_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum IconLabel {
  mine(
    '/mine',
    '我的',
    Icons.person,
  ),
  setting(
    '/setting',
    '设置',
    Icons.settings,
  ),
  exit(
    '/login',
    '退出',
    Icons.exit_to_app,
  );

  const IconLabel(
    this.url,
    this.label,
    this.icon,
  );
  final String url;
  final String label;
  final IconData icon;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('科陆CMS'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (IconLabel item) {
              if (item.url == '/login') {
                context.go(item.url);
              } else {
                context.push(item.url);
              }
            },
            offset: const Offset(120, 48),
            itemBuilder: (context) => IconLabel.values
                .map<PopupMenuEntry<IconLabel>>(
                  (icon) => PopupMenuItem<IconLabel>(
                    value: icon,
                    child: ListTile(
                      title: Text(icon.label),
                      leading: Icon(icon.icon),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
      body: const HomeMenus(),
    );
  }
}

class HomeMenus extends StatelessWidget {
  const HomeMenus({super.key});

  static const List<Menu> menus = [
    Menu(
      items: [
        Item(
          label: '来料点收',
          url: '/collect',
          icon: Icons.add_alarm_outlined,
          outerGradient: LinearGradient(
            colors: [
              Color(0XFF9a5df5),
              Color(0XFFa29fed),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          innerGradient: LinearGradient(
            colors: [
              Color(0XFFb7affe),
              Color(0XFF9c5de6),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        Item(
          label: 'QC抽检',
          url: '/qc/check',
          icon: Icons.fact_check_outlined,
          outerGradient: LinearGradient(
            colors: [
              Color(0XFF0299f2),
              Color(0XFF7abfec),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          innerGradient: LinearGradient(
            colors: [
              Color(0XFF8dd6ff),
              Color(0XFF0399f1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ],
      title: '收货',
    ),
    Menu(
      items: [
        Item(
          label: '组垛埋货',
          url: '/palletize',
          icon: Icons.pallet,
          outerGradient: LinearGradient(
            colors: [
              Color(0XFFcbaa03),
              Color(0XFFdfc288),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          innerGradient: LinearGradient(
            colors: [
              Color(0XFFfdd889),
              Color(0XFFccaa08),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        Item(
          label: '入库管理',
          url: '/instorage',
          icon: PdaIcon.instorage,
          outerGradient: LinearGradient(
            colors: [
              Color(0XFF07b207),
              Color(0XFF80d76d),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          innerGradient: LinearGradient(
            colors: [
              Color(0XFF94f36e),
              Color(0XFF0db30b),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        Item(
          label: '出库管理',
          url: '/outstorage',
          icon: PdaIcon.outstorage,
          outerGradient: LinearGradient(
            colors: [
              Color(0XFFd2680d),
              Color(0XFFdc8e60),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          innerGradient: LinearGradient(
            colors: [
              Color(0XFFfd9f5e),
              Color(0XFFd3690e),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        Item(
          label: '入库解绑',
          url: '/unbind',
          icon: Icons.lock_open,
          outerGradient: LinearGradient(
            colors: [
              Color(0XFF21a58e),
              Color(0XFF46c5c0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          innerGradient: LinearGradient(
            colors: [
              Color(0XFF4fd9cb),
              Color(0XFF24a791),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        Item(
          label: '拆零拣选',
          url: '/pick',
          icon: Icons.select_all,
          outerGradient: LinearGradient(
            colors: [
              Color(0XFFd1d30d),
              Color(0XFFdfe260),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          innerGradient: LinearGradient(
            colors: [
              Color(0XFFfcfb5a),
              Color(0XFFd2d30e),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ],
      title: '出入库',
    ),
    Menu(
      items: [
        Item(
          label: '盘点',
          url: '/stocktake',
          icon: PdaIcon.stocktake,
          outerGradient: LinearGradient(
            colors: [
              Color(0XFF06b207),
              Color(0XFF86df6e),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          innerGradient: LinearGradient(
            colors: [
              Color(0XFF95f36e),
              Color(0XFF0eaf0c),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        Item(
          label: '库存查询',
          url: '/storage/search',
          icon: PdaIcon.search,
          outerGradient: LinearGradient(
            colors: [
              Color(0XFFd2680d),
              Color(0XFFdc8e60),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          innerGradient: LinearGradient(
            colors: [
              Color(0XFFfd9f5e),
              Color(0XFFd3690e),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        Item(
          label: '库存明细',
          url: '/storage/detail',
          icon: PdaIcon.detail,
          outerGradient: LinearGradient(
            colors: [
              Color(0XFF0299f2),
              Color(0XFF7abfec),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          innerGradient: LinearGradient(
            colors: [
              Color(0XFF8dd6ff),
              Color(0XFF0399f1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ],
      title: '库内',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemBuilder: (context, i) {
          final menu = menus[i];
          final items = menu.items;
          return Container(
            margin: const EdgeInsets.only(
              bottom: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  menu.title,
                  style: const TextStyle(
                    color: Color(0XFF01F2F5),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GridView.builder(
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 24,
                  ),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              context.push(item.url);
                            },
                            child: GradientBorder(
                              outerGradient: item.outerGradient,
                              innerGradient: item.innerGradient,
                              child: Icon(
                                item.icon,
                                color: Colors.white,
                                size: 56,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            item.label,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          );
        },
        itemCount: menus.length,
      ),
    );
  }
}
