import 'package:desafio_mjv_academy/components/storecar_bottom_navigator.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text("Home"),
      bottomNavigationBar: const StoreCarBottomNavigator(),
    );
  }
}
