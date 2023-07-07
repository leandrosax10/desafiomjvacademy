import 'package:flutter/material.dart';

import 'pages/cadastro/cadastro.dart';
import 'pages/home/home.dart';
import 'pages/novos/novos.dart';
import 'pages/seminovos/seminovos.dart';
import 'pages/sobre/sobre_nos.dart';

class AppRoutes {
  static String initialRoute = '/';
  static String novos = '/novos';
  static String seminovos = '/seminovos';
  static String cadastro = '/cadastro';
  static String sobre = '/sobre';
  //static String detalhe = '/detalheItem';

  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      '/': (context) => const HomePage(),
      '/novos': (context) => const NovosPage(),
      '/seminovos': (context) => const SemiNovosPage(),
      '/cadastro': (context) => const CadastroPage(),
      '/sobre': (context) => const SobreNosPage(),
      // detalhe: (context) => const DetalhePage(),
    };
  }
}
