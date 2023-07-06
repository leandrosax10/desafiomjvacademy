import 'package:flutter/material.dart';

import '../components/storecar_bottom_navigator.dart';
import '../components/storecar_drawer_menu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const StoreCarDrawerMenu(),
      appBar: AppBar(),
      body: const Text("Home"),
      bottomNavigationBar: const StoreCarBottomNavigator(),
    );
  }
}
