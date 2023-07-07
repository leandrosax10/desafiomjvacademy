import 'package:flutter/material.dart';

import 'storecar_text_widget.dart';

class StoreCarAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const StoreCarAppBar({super.key, this.title = ''});

  static Size get size => const Size.fromHeight(kToolbarHeight);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: TextWidget(
        title,
        align: TextAlign.center,
        color: Colors.white,
        fontSize: 16,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Image.asset('assets/img/logo.png', width: 56, height: 56),
        ),
      ],
    );
  }
}
