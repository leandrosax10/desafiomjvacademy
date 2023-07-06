import 'package:desafio_mjv_academy/components/storecar_bottom_navigator.dart';
import 'package:flutter/material.dart';

class SeminovosPage extends StatelessWidget {
  const SeminovosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text("Seminovos"),
      bottomNavigationBar: const StoreCarBottomNavigator(),
    );
  }
}