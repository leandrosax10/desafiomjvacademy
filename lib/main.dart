import 'package:desafio_mjv_academy/pages/home/home.dart';
import 'package:desafio_mjv_academy/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<HomeProvider>(
      create: (_) => HomeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final pageViewContoller = PageController();

  void dispose() {
    pageViewContoller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StoreCar',
      theme: ThemeData(primaryColor: Colors.black),
      //home: const Home(),
      home: PageView(
        controller: pageViewContoller,
        children: const [
          HomePage(),
        ],
      ),
    );
  }
}
