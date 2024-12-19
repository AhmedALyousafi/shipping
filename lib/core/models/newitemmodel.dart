import 'package:flutter/material.dart';

class MenuItemModel {
  final String text;
  final IconData icon;
  final Color iconColor;
  final Function onPressed;

  MenuItemModel(
      {required this.text,
      required this.icon,
      required this.iconColor,
      required this.onPressed});
}
