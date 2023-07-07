import 'package:flutter/material.dart';

class StoreCarIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData? icon;
  final double? size;
  final Color? color;
  const StoreCarIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, size: size, color: color),
    );
  }
}
