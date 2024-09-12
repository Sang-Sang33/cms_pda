import 'package:flutter/material.dart';

class CardDescription extends StatelessWidget {
  const CardDescription({
    super.key,
    required this.label,
    required this.value,
    double? labelWidth,
    Color? valueTextColor,
    this.trailing,
  })  : labelWidth = labelWidth ?? 80,
        valueTextColor = valueTextColor ?? Colors.black;

  final String label;
  final String value;
  final double labelWidth;
  final Color valueTextColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      SizedBox(
        width: labelWidth,
        height: 32,
        child: Text(
          label,
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Color(0xff7a7a7a),
            fontSize: 16,
          ),
        ),
      ),
      const SizedBox(
        width: 12,
      ),
      Expanded(
        child: Text(
          value,
          softWrap: true,
          style: TextStyle(
            fontSize: 16,
            color: valueTextColor,
          ),
        ),
      ),
    ];

    if (trailing != null) {
      children.add(trailing!);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
