import 'package:flutter/material.dart';

class StoreCarBottomNavigator extends StatelessWidget {
  const StoreCarBottomNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      backgroundColor: Colors.black,
      unselectedLabelStyle: const TextStyle(color: Colors.white),
      selectedLabelStyle: const TextStyle(color: Colors.blue),
      items: [
        BottomNavigationBarItem(
            icon: Image.asset('assets/img/two-cars.png'), label: "todos"),
        BottomNavigationBarItem(
            icon: Image.asset('assets/img/sale-car.png'), label: "Novos"),
        BottomNavigationBarItem(
            icon: Image.asset('assets/img/two-cars.png'), label: 'Seminovos')
      ],
    );
  }
}
