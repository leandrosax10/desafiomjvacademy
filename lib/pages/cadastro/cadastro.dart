import 'package:flutter/material.dart';

import '../../components/storecar_app_bar.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: StoreCarAppBar(
        title: 'Cadastro',
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
