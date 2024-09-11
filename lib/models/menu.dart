import 'package:flutter/material.dart';

class Menu {
  final List<Item> items;
  final String title;
  const Menu({
    required this.items,
    required this.title,
  });
}

class Item {
  final String label;
  final String url;
  final IconData icon;
  final Gradient outerGradient;
  final Gradient innerGradient;

  const Item({
    required this.label,
    required this.url,
    required this.icon,
    required this.outerGradient,
    required this.innerGradient,
  });
}
