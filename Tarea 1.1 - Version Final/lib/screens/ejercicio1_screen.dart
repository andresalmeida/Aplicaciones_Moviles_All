import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarea1/screens/ejercicio2_screen.dart';

import '../Pages/Tarifas.dart';

void main() {
  runApp(const Ejercicio1Screen());
}

class Ejercicio1Screen extends StatelessWidget {
  const Ejercicio1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
        useMaterial3: true,
      ),
      home: Tarifas(),
    );
  }
}
