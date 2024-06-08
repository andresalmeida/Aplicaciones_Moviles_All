// ejercicio3_screen.dart
import 'package:flutter/material.dart';
import '../Pages/Guesas.dart';

void main() {
  runApp(const Ejercicio3Screen());
}

class Ejercicio3Screen extends StatelessWidget {
  const Ejercicio3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GuesasApp(),
    );
  }
}
