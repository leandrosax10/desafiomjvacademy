import 'package:flutter/material.dart';

import '../../components/storecar_app_bar.dart';

class SobreNosPage extends StatelessWidget {
  const SobreNosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: StoreCarAppBar(
        title: 'Sobre nós',
      ),
      body: Column(
        children: [
          Placeholder(),
          FlutterLogo(),
        ],
      ),
    );
  }
}
