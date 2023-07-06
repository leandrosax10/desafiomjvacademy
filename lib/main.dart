import 'app_widget.dart';
import 'providers/home_provider.dart';
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
