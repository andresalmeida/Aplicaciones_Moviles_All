import 'package:flutter/material.dart';
import 'package:primer_entorno/paginas/Dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mi primera Aplicacion",
      home: Dashboard(),
    );
  }
}