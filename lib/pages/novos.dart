import 'package:flutter/material.dart';

import '../components/storecar_bottom_navigator.dart';

class NovosPage extends StatelessWidget {
  const NovosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text("Novos"),
      bottomNavigationBar: const StoreCarBottomNavigator(),
    );
  }
}