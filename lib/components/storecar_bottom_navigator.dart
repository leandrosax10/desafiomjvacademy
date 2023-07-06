import 'package:desafio_mjv_academy/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/home_provider.dart';

class StoreCarBottomNavigator extends StatefulWidget {
  const StoreCarBottomNavigator({super.key});

  @override
  State<StoreCarBottomNavigator> createState() => _StoreCarBottomNavigatorState();
}

class _StoreCarBottomNavigatorState extends State<StoreCarBottomNavigator> {

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return BottomNavigationBar(
      currentIndex: 1,
      backgroundColor: Colors.black,
      unselectedLabelStyle: const TextStyle(color: Colors.white),
      selectedLabelStyle: const TextStyle(color: Colors.blue),
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.white,
      useLegacyColorScheme: false,
      onTap: (position) {
        if (position == 0) {
          Navigator.of(context).pushNamed(AppRoutes.initialRoute);
        } else if (position == 1) {
          Navigator.of(context).pushNamed(AppRoutes.novos);
        } else if (position == 2) {
          Navigator.of(context).pushNamed(AppRoutes.seminovos);
        }

        homeProvider.setIndex(position);
      },
      items: [
        BottomNavigationBarItem(
            icon: Image.asset('assets/img/two-cars.png', width: 24, height: 24),
            label: "Todos"),
        BottomNavigationBarItem(
            icon: Image.asset('assets/img/new-car.png', width: 24, height: 24),
            label: "Novos"),
        BottomNavigationBarItem(
            icon: Image.asset('assets/img/sale-car.png', width: 24, height: 24),
            label: 'Seminovos')
      ],
    );
  }
}
