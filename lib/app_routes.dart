import 'package:desafio_mjv_academy/pages/home/home.dart';
import 'package:desafio_mjv_academy/pages/novos/novos.dart';
import 'package:desafio_mjv_academy/pages/seminovos/seminovos.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static String initialRoute = '/';
  static String novos = '/novos';
  static String seminovos = '/seminovos';
  //static String detalhe = '/detalheItem';

  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      initialRoute: (context) => const HomePage(),
      novos: (context) => const NovosPage(),
      seminovos: (context) => const SeminovosPage(),
      // detalhe: (context) => const DetalhePage(),
    };
  }
}
