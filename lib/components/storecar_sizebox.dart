import 'package:flutter/material.dart';

class StoreCarSizedBox extends StatelessWidget {
  final double size;
  final bool isFull;
  final bool isHorizontal;

  const StoreCarSizedBox({
    super.key,
    this.size = 16,
    this.isFull = false,
    this.isHorizontal = false,
  });

  @override
  Widget build(BuildContext context) {
    return isFull == true
        ? const Spacer()
        : SizedBox(
            height: isHorizontal == false ? size : null,
            width: isHorizontal == true ? size : null,
          );
  }
}