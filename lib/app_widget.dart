import 'package:flutter/material.dart';

import 'app_routes.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final pageViewController = PageController();

  void dispose() {
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StoreCar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.black),
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes(),
    );
  }
}
