import 'package:desafio_mjv_academy/pages/cadastro/cadastro.dart';
import 'package:desafio_mjv_academy/pages/sobre/sobre_nos.dart';

import 'pages/home/home.dart';
import 'pages/novos/novos.dart';
import 'pages/seminovos/seminovos.dart';
import 'package:flutter/material.dart';

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
      '/seminovos': (context) => const SeminovosPage(),
      '/cadastro': (context) => const CadastroPage(),
      '/sobre': (context) => const SobreNosPage(),
      // detalhe: (context) => const DetalhePage(),
    };
  }
}
