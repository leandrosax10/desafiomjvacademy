import 'package:desafio_mjv_academy/pages/home.dart';
import 'package:desafio_mjv_academy/pages/novos.dart';
import 'package:desafio_mjv_academy/pages/seminovos.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static String initialRoute = '/';
  static String novos = '/novos';
  static String seminovos = '/seminovos';
  //static String detalhe = '/detalheItem';

  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      initialRoute: (context) => const Home(),
      novos: (context) => const NovosPage(),
      seminovos: (context) => const SeminovosPage(),
      // detalhe: (context) => const DetalhePage(),
    };
  }
}
