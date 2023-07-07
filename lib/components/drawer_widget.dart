import 'package:flutter/material.dart';

import 'storecar_sizebox.dart';
import 'storecar_text_widget.dart';

class DrawerWidget extends StatelessWidget {
  final void Function()? onTap;
  final double? width;
  final String image;
  final String label;
  const DrawerWidget({
    super.key,
    this.onTap,
    this.width,
    required this.image,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              image,
              color: Colors.black,
              width: 20,
              height: 20,
            ),
            const StoreCarSizedBox(isHorizontal: true),
            TextWidget(label),
          ],
        ),
      ),
    );
  }
}
