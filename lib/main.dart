import 'package:desafio_mjv_academy/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StoreCar',
      theme: ThemeData(primaryColor: Colors.black
      ),
      home: const Home()
    );
  }
}
