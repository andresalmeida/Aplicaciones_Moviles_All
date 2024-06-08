import 'package:flutter/material.dart';
import '../Pages/Transportes.dart';

void main() {
  runApp(const Ejercicio2Screen());
}

class Ejercicio2Screen extends StatelessWidget {
  const Ejercicio2Screen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Transportes(),
    );
  }
}
