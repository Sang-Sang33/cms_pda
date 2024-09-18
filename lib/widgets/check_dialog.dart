import 'package:flutter/material.dart';

//定义枚举类型

class CheckDialog extends Dialog {
  final Widget content; //内容
  final void Function()? cancelCallBack;
  final void Function()? confirmCallBack;

  const CheckDialog({
    super.key,
    required this.content,
    this.confirmCallBack,
    this.cancelCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: upgradeDialog(context),
      ),
    );
  }

  //自定义升级弹窗
  Widget upgradeDialog(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          decoration: const ShapeDecoration(
            color: Color(0xfff2f2f2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                child: content,
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 1,
                      color: Colors.grey,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              width: 1,
                              color: Colors.grey,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            confirmCallBack!();
                          },
                          child: const Text(
                            '取消',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff666666),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          cancelCallBack!();
                        },
                        child: const Text(
                          '确认',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
