import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'screens/ejercicio1_screen.dart';
import 'screens/ejercicio2_screen.dart';
import 'screens/ejercicio3_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicios',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
      routes: {
        '/ejercicio1': (context) => Ejercicio1Screen(),
        '/ejercicio2': (context) => Ejercicio2Screen(),
        '/ejercicio3': (context) => Ejercicio3Screen(),

      },
    );
  }
}
