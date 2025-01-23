import 'package:flutter/material.dart';
import 'package:tcc/formul.dart';
import 'grad.dart';
import 'mestrado.dart';
import 'noturno.dart';
import 'tecnico.dart';
import 'homepage.dart';
import 'info.dart';
import 'moda.dart';
import 'meca.dart';
import 'cadastro.dart';
import 'cursos.dart';
import 'relatos.dart';
import 'relVisiveis.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(title: 'SAD'),
          'formul': (context) => FormulPage(),
          'grad': (context) => Graduacao(),
          'tecnico': (context) => Tecnico(),
          'cadastro': (context) => Cadastro(),
          'mestrado': (context) => Mestrado(),
          'noturno': (context) => Noturno(),
          'cursos': (context) => Cursos(),
          'info': (context) => Info(),
          'moda': (context) => Moda(),
          'meca': (context) => Meca(),
          'relatos': (context) => Relatos(),
          'relVis': (context) => RelVis(),
        });
  }
}


